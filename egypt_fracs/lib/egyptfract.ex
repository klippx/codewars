defmodule Egyptfract do
  def decompose(n) do
    {s, t} = parse(n)
      |> to_integer
      |> simplify
      |> egyptify

    case t do
      :gt_one -> [stringify(s)]
      {1, _}  -> [stringify(s)] ++ [stringify(t)]
      _       -> [stringify(s)] ++ decompose(stringify(t))
    end
  end

  defp stringify({x,y}) do
    case y do
      1 -> "#{x}"
      _ -> "#{x}/#{y}"
    end
  end

  defp parse(n) do
    cond do
      Regex.match?(~r/\./, n) -> parse_float(n)
      Regex.match?(~r/\//, n) -> parse_frac(n)
      true -> n
    end
  end

  defp parse_float(n) do
    [numerator(n), denomenator(n)]
  end

  defp parse_frac(n) do
    String.split(n, "/")
  end

  defp to_integer([x, y]) do
    {int_x, _} = Integer.parse(x)
    {int_y, _} = Integer.parse(y)
    {int_x, int_y}
  end

  def egyptify({x, y}) do
    cond do
      x > y -> { { x, y }, :gt_one }
      true ->
        {
          { 1, (round Float.ceil(y/x)) },
          { mod(-y,x), round (y*Float.ceil(y/x)) } |> simplify
        }
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
