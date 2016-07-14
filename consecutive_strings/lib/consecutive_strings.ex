defmodule Longestconsec do

  def longest_consec(strarr, k) do
    consecutives(strarr, k)
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.max_by(&(String.length(&1)))
  end

  defp consecutives(strarr, _) when length(strarr) == 0 do
    [[""]]
  end

  defp consecutives(_, k) when k < 1 do
    [[""]]
  end

  defp consecutives(strarr, k) when k > length(strarr) do
    [[""]]
  end

  defp consecutives(strarr, k) do
    Stream.unfold(length(strarr)-k, fn
      -1 -> nil
       n -> {
        strarr
        |> Enum.drop(n)
        |> Enum.take(k),
        n-1
      }
    end)
    |> Enum.to_list()
    |> Enum.reverse
  end
end
