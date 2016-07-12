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
      |> egyptify
      |> diversify
  end

  def diversify(s) when is_tuple(s) do
    case s do
      {a, _} when a == 0 -> []
      {a, _} when a == 1 -> [stringify(s)]
      {a, b} when div(a,b) == a/b -> [stringify(s)]
      _ ->
        {ds, dt} = split_positive_numerator(s)
        [stringify(ds)] ++ process(stringify(dt))
    end
  end

  def diversify(arg) when is_list(arg) do
    [s, t] = arg
    [stringify(s)] ++ process(stringify(t))
  end

  def split_positive_numerator({s, t}) do
    {
      {div(s,t), 1},
      {s-t*div(s,t), t} |> simplify
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
      Regex.match?(~r/\./, n) -> parse_float(n)
      Regex.match?(~r/\//, n) -> parse_frac(n)
      true -> n
    end
  end

  def parse_float(n) do
    [numerator(n), denomenator(n)]
  end

  def parse_frac(n) do
    String.split(n, "/")
  end

  def to_integer([x, y]) do
    {int_x, _} = Integer.parse(x)
    {int_y, _} = Integer.parse(y)
    {int_x, int_y}
  end

  def egyptify({x, y}) do
    cond do
      x == 0 -> { x, y }
      x == 1 -> { x, y }
      x > y  -> { x, y }
      true   ->
        [
          { 1, (round Float.ceil(y/x)) },
          { mod(-y,x), round (y*Float.ceil(y/x)) } |> simplify
        ]
    end
  end

  def mod(left, right) do
    cond do
      left * right >= 0 -> :erlang.rem(left, right)
      true -> right + :erlang.rem(left, right)
    end
  end

  def simplify({x, y}) do
    cond do
      mod(x, y) == 0 -> {div(x,y), 1}
      div(y, x) == y/x -> {1, div(y, x)}
      true -> {x, y}
    end
  end

  def numerator(n) do
    String.replace(n, ~r/0\.|\./, "")
  end

  def denomenator(n) do
    Enum.map(0..(String.length(n)-2),
      fn x
        when x == 0 -> "1"
        _ -> "0"
      end
    ) |> Enum.join
  end
end
