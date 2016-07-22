defmodule PalindromicPrimesTest do
  use ExUnit.Case

  test "basic test" do
    assert PalindromicPrimes.nth(1) == 2
    assert PalindromicPrimes.nth(2) == 3
    assert PalindromicPrimes.nth(3) == 5
    assert PalindromicPrimes.nth(4) == 7
    assert PalindromicPrimes.nth(5) == 11
    assert PalindromicPrimes.nth(10) == 191
    assert PalindromicPrimes.nth(25) == 11411
    assert PalindromicPrimes.nth(50) == 30703
  end
end
