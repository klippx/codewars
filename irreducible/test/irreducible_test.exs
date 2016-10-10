defmodule SumfractsTest do

  use ExUnit.Case
  doctest Sumfracts

  defp testing(_, u, ans) do
    assert Sumfracts.sum_fracts(u) == ans
  end
  test "sum_fracts" do
    testing(1, [{1, 2}, {1, 3}, {1, 4}], {13, 12})
    testing(2, [{1, 3}, {5, 3}], 2)
    testing(3, [], nil)
    testing(4, [{2, 7}, {1, 3}, {1, 12}], {59, 84})
    testing(5, [{1, 4}, {1, 7}, {2, 12}, {2, 21}, {2, 42}], {59, 84})
    testing(6, [{69, 130}, {87, 1310}, {3, 4}], {9177, 6812})
    testing(6, [{81345, 15786}, {87546, 11111111}, {43216, 255689}], {239033687673439875, 44847850151521494})
  end

end
