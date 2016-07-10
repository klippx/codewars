defmodule Egyptfract do
  def decompose(n) do
    parse(n)
      |> to_integer
      |> simplify
      |> egyptify
  end

  def parse(n) do
    cond do
      Regex.match?(~r/\./, n) -> [get_numerator(n), get_denomenator(n)]
      Regex.match?(~r/\//, n) -> String.split(n, "/")
      true -> n
    end
  end

  def to_integer([x, y]) do
    {int_x, _} = Integer.parse(x)
    {int_y, _} = Integer.parse(y)
    {int_x, int_y}
  end

  def egyptify({x, y}) do
    {
      { 1, (round Float.ceil(y/x)) },
      { mod(-y,x), round (y*Float.ceil(y/x)) }
    }
  end

  def mod(left, right) do
    cond do
      left * right >= 0 -> :erlang.rem(left, right)
      true -> right + :erlang.rem(left, right)
    end
  end

  def simplify({x, y}) do
    cond do
      div(y, x) == y/x -> {1, div(y, x)}
      true -> {x, y}
    end
  end

  def get_numerator(n) do
    String.replace(n, ~r/0\.|\./, "")
  end

  def get_denomenator(n) do
    Enum.map(0..(String.length(n)-2),
      fn x
        when x == 0 -> "1"
        _ -> "0"
      end)
      |> Enum.join
  end
end
