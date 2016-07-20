defmodule PalindromicPrimesTest do
  use ExUnit.Case

  test "basic test" do
    assert PalindromicPrimes.palprimes(20) == [2, 3, 5, 7, 11, 101, 131, 151, 181, 191, 313, 353, 373, 383, 727, 757, 787, 797, 919, 929]
  end
end
