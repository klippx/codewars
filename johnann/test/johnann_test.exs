defmodule JohnannTest do

  use ExUnit.Case

  defp testJohn(numtest, n, ans) do
    IO.puts("Johnann.john/1 test ##{numtest}\n")
    assert Johnann.john(n) == ans
  end
  test "john" do
    testJohn(1, 11, [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6])
    testJohn(2, 8, [0, 0, 1, 2, 2, 3, 4, 4])
    testJohn(3, 14, [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 7, 8])
    testJohn(4, 9, [0, 0, 1, 2, 2, 3, 4, 4, 5])
    testJohn(5, 5, [0, 0, 1, 2, 2])
    testJohn(6, 30, [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12, 12, 13, 14, 14, 15, 16, 16, 17, 17, 18])
  end

  defp testAnn(numtest, n, ans) do
    IO.puts("Johnann.ann/1 test ##{numtest}\n")
    assert Johnann.ann(n) == ans
  end
  test "ann" do
    testAnn(1, 6, [1, 1, 2, 2, 3, 3])
    testAnn(2, 15, [1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 8, 8, 9])
    testAnn(3, 11, [1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6])
    testAnn(4, 12, [1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7])
  end

  defp testSumAnn(numtest, n, ans) do
    IO.puts("Johnann.sum_ann/1 test ##{numtest}\n")
    assert Johnann.sum_ann(n) == ans
  end
  test "sum_ann" do
    testSumAnn(1, 115, 4070)
    testSumAnn(2, 150, 6930)
    testSumAnn(3, 112, 3860)
    testSumAnn(4, 83, 2118)
    testSumAnn(5, 59, 1069)
    testSumAnn(6, 1000, 308834)
    testSumAnn(7, 10000, 30899800)
  end

  defp testSumJohn(numtest, n, ans) do
    IO.puts("Johnann.sum_john/1 test ##{numtest}\n")
    assert Johnann.sum_john(n) == ans
  end
  test "sum_john" do
    testSumJohn(1, 75, 1720)
  end

end
