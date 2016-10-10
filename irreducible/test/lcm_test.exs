defmodule LcmTest do

  use ExUnit.Case
  doctest Lcm

  defp testing(numtest, u, ans) do
    IO.puts("Test #{numtest}")
    assert Lcm.mgn(u) == ans
  end
  test "mgn" do
    testing(1, [2, 3, 4], 12)
    testing(2, [4, 7, 12, 21, 42], 84)
  end

end
