defmodule LongestconsecTest do
  use ExUnit.Case

  def testing(numtest, s, k, ans) do
    IO.puts("Test #{numtest}")
    assert Longestconsec.longest_consec(s, k) == ans
  end

  test "longest_consec" do
    testing(1, ["zone", "abigail", "theta", "form", "libe", "zas"], 2, "abigailtheta")
    testing(2, ["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1, "oocccffuucccjjjkkkjyyyeehh")
    testing(3, [], 3, "")
    testing(4, ["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2, "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck")
    testing(5, ["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2, "wlwsasphmxxowiaxujylentrklctozmymu")
    testing(6, ["zone", "abigail", "theta", "form", "libe", "zas"], -2, "")
    testing(7, ["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3, "ixoyx3452zzzzzzzzzzzz")
    testing(8, ["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15, "")
    testing(9, ["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0, "")
  end
end
