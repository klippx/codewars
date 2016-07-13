defmodule EgyptfractTest do
  use ExUnit.Case

  defp testing(s, ans) do
    IO.puts("Test #{s}")
    assert Egyptfract.decompose(s) == ans
  end

  test "decompose" do
    testing("3/4", ["1/2", "1/4"])
    testing("12/4", ["3"])
    testing("4/5", ["1/2", "1/4", "1/20"])
    testing("0.66", ["1/2", "1/7", "1/59", "1/5163", "1/53307975"])
    testing("0", [])
    testing("125/100", ["1", "1/4"])
    testing("2/8", ["1/4"])
    testing("0/1000", [])
    testing("126/100", ["1", "1/4", "1/100"])
    testing("3000/4187", ["1/2", "1/5", "1/61", "1/9090", "1/105529529", "1/30625323994615534", "1/3751641879100695842954773901805090"])
  end
end
