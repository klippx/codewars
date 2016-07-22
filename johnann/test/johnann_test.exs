defmodule JohnannTest do

  use ExUnit.Case

  defp testJohn(numtest, n, ans) do
    IO.puts("Johnann.john/1 #{numtest} \n")
    assert Johnann.john(n) == ans
  end
  test "john" do
    testJohn(1, 11, [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6])
  end

  defp testAnn(numtest, n, ans) do
    IO.puts("Johnann.ann/1 #{numtest} \n")
    assert Johnann.ann(n) == ans
  end
  test "ann" do
    testAnn(1, 6, [1, 1, 2, 2, 3, 3])
  end

  defp testSumAnn(numtest, n, ans) do
    IO.puts("Johnann.sum_ann/1 \n")
    assert Johnann.sum_ann(n) == ans
  end
  test "sum_ann" do
    testSumAnn(1, 115, 4070)
  end

  defp testSumJohn(numtest, n, ans) do
    IO.puts("Johnann.sum_john/1 #{numtest} \n")
    assert Johnann.sum_john(n) == ans
  end
  test "sum_john" do
    testSumJohn(1, 75, 1720)
  end

end
