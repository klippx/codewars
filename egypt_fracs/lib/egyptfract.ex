defmodule Egyptfract do
  def decompose(n) do
    cond do
      n == "0" -> []
      true -> process(n)
    end
  end

  def process(n) do
    parse(n)
      |> to_integer
      |> simplify
      |> apply_egyptian_algorithm
      |> parse_result
  end

  def apply_egyptian_algorithm({x, y}) do
    cond do
      !Enum.member?(0..1, x) and x <= y ->
        [
          {         1,   div_ceil(y,x) },
          { mod(-y,x), y*div_ceil(y,x) } |> simplify
        ]
      true -> { x, y }
    end
  end

  defp div_ceil(a,b) do
    div(a,b) + 1
  end

  def parse_result(arg) do
    case arg do
      [s, t] when is_list(arg)    -> [stringify(s)] ++ process(stringify(t))
      {a, _} when a == 0          -> []
      {a, _} when a == 1          -> [stringify(arg)]
      {a, b} when div(a,b) == a/b -> [stringify(arg)]
      _ ->
        {ds, dt} = split_positive_numerator(arg)
        [stringify(ds)] ++ process(stringify(dt))
    end
  end

  def split_positive_numerator({s, t}) do
    {
      {       div(s,t), 1 },
      { s - t*div(s,t), t } |> simplify
    }
  end

  def stringify({x,y}) do
    case y do
      1 -> "#{x}"
      _ -> "#{x}/#{y}"
    end
  end

  def parse(n) do
    cond do
      Regex.match?(~r/\./, n) -> [numerator(n), denomenator(n)]
      Regex.match?(~r/\//, n) -> String.split(n, "/")
      true -> n
    end
  end

  def to_integer([x, y]) do
    {int_x, _} = Integer.parse(x)
    {int_y, _} = Integer.parse(y)
    {int_x, int_y}
  end

  def mod(left, right) do
    cond do
      left * right >= 0 ->         :erlang.rem(left, right)
      true              -> right + :erlang.rem(left, right)
    end
  end

  def simplify({x, y}) do
    cond do
      mod(x,2) == 0 and mod(y,2) == 0 -> simplify({div(x,2), div(y,2)})
      mod(x,5) == 0 and mod(y,5) == 0 -> simplify({div(x,5), div(y,5)})
      mod(x,y) == 0   -> { div(x,y), 1 }
      div(y,x) == y/x -> { 1, div(y,x) }
      true -> {x, y}
    end
  end

  def numerator(n) do
    String.replace(n, ~r/0\.|\./, "")
  end

  def denomenator(n) do
    [1] ++ List.duplicate(0, String.length(n)-2) |> Enum.join
  end
end
