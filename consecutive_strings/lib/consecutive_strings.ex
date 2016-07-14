defmodule Longestconsec do

  def longest_consec(strarr, _) when length(strarr) == 0, do: ""
  def longest_consec(_, k) when k < 1, do: ""
  def longest_consec(strarr, k) when k > length(strarr), do: ""
  def longest_consec(strarr, k) do
    consecutives(strarr, k)
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.max_by(&(String.length(&1)))
  end

  defp consecutives(strarr, k) do
    Stream.unfold(length(strarr)-k, fn
     -1 -> nil
      n -> { get_consecutive_elems(strarr, n, k), n-1 }
    end)
    |> Enum.to_list()
  end

  defp get_consecutive_elems(strarr, n, k) do
    strarr
    |> Enum.drop(n)
    |> Enum.take(k)
  end
end
