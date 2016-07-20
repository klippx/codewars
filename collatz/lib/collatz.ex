defmodule Collatz do

  def collatz(n) do
    collatz_sequence(n)
    |> List.flatten
    |> Enum.join("->")
  end

  defp collatz_sequence(1), do: [1]
  defp collatz_sequence(n) when rem(n,2) == 0, do: [n, collatz(div(n,2))]
  defp collatz_sequence(n), do: [n, collatz(3 * n + 1)]

end
