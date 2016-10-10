defmodule LcmTest do

  use ExUnit.Case
  doctest Lcm

  defp testing(_, u, ans) do
    assert Lcm.mgn(u) == ans
  end
  test "mgn" do
    testing(1, [2, 3, 4], 12)
    testing(2, [4, 7, 12, 21, 42], 84)
    testing(3, [15786, 11111111, 255689], 44847850151521494)
  end

end
