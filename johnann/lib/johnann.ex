defmodule Johnann do

  def john(n) when n == 0, do: []
  def john(n) when n >= 1 do
    john(n-1) ++ [pjohn(n-1)]
  end

  def ann(n) when n == 0, do: []
  def ann(n) when n >= 1 do
    ann(n-1) ++ [pann(n-1)]
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
    # your code
  end
  def sum_ann(n) when n >= 1 do
    # your code
  end

end
