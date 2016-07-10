defmodule EgyptfractTest do
  use ExUnit.Case

  defp testing(numtest,s, ans) do
    IO.puts("Test #{numtest}")
    assert Egyptfract.decompose(s) == ans
  end

  test "decompose" do
    testing(1, "3/4", ["1/2", "1/4"])
    testing(2, "12/4", ["3"])
    testing(3, "4/5", ["1/2", "1/4", "1/20"])
    testing(4, "0.66", ["1/2", "1/7", "1/59", "1/5163", "1/53307975"])
    testing(5, "0", [])
    testing(6, "125/100", ["1", "1/4"])
    testing(7, "2/8", ["1/4"])
    # testing(8, "126/100", ["1", "1/4", "1/100"])
  end
end
