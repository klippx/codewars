defmodule Johnann do

  def john(n) when n == 0, do: []
  def john(n) when n >= 1 do
    john(n-1) ++ [pjohn(n-1)]
  end

  def ann(n) when n >= 1 do
    Stream.unfold(0, fn
      ^n -> nil
       n -> {pann(n), n+1}
    end) |> Enum.to_list
  end

  defp pjohn(n) when n == 0, do: 0
  defp pjohn(n) when n >= 1 do
    t = pjohn(n-1)
    n - pann(t)
  end

  defp pann(n) when n == 0, do: 1
  defp pann(n) when n >= 1 do
    t = pann(n-1)
    n - pjohn(t)
  end

  def sum_john(n) when n >= 1 do
    john(n) |> Enum.sum
  end
  def sum_ann(n) when n >= 1 do
    ann(n) |> Enum.sum
  end

end
