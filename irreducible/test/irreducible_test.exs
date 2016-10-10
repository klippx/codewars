defmodule SumfractsTest do

  use ExUnit.Case
  doctest Sumfracts

  defp testing(numtest, u, ans) do
    IO.puts("Test #{numtest}")
    assert Sumfracts.sum_fracts(u) == ans
  end
  test "sum_fracts" do
    testing(1, [{1, 2}, {1, 3}, {1, 4}], {13, 12})
    testing(2, [{1, 3}, {5, 3}], 2)
  end

end
