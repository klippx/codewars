defmodule CollatzTest do
  use ExUnit.Case

  def testCollatz(nb, n, ans) do
    IO.puts("Test #{nb}")
    assert Collatz.collatz(n) == ans
  end

  test "collatz" do
    testCollatz 1, 2, "2->1"
    testCollatz 2, 3, "3->10->5->16->8->4->2->1"
    testCollatz 3, 4, "4->2->1"
  end
end
