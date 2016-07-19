defmodule PiapproxTest do
  use ExUnit.Case
  doctest Piapprox

  def testPiApprox(nb, epsilon, ans) do
    IO.puts("Test #{nb}")
    assert Piapprox.iter_pi(epsilon) == ans
  end

  test "iter_pi" do
    testPiApprox 1, 0.1,      [    10, 3.0418396189]
    testPiApprox 2, 0.01,     [   100, 3.1315929035]
    testPiApprox 3, 0.001,    [  1000, 3.1405926538]
    testPiApprox 4, 7.001e-4, [  1429, 3.1422924435]
    testPiApprox 5, 6.001e-5, [ 16664, 3.1415326439]
  end
end
