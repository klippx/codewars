defmodule Johnann do

  def john(n) when n == 0, do: []
  def john(n) when n >= 1 do
    john(n-1) ++ [pjohn(n-1)]
  end

  def ann(n) when n >= 1 do
    Stream.unfold(0, fn
      ^n -> nil
       n -> {pann(n), n+1}
    end) |> Enum.to_list
  end

  defp pjohn(n) when n == 0, do: 0
  defp pjohn(n) when n >= 1 do
    t = pjohn(n-1)
    n - pann(t)
  end

  defp pann(n) when n == 0, do: 1
  defp pann(n) when n >= 1 do
    name = "pann/#{n}"
    case :ets.info(:ann_table) do
      :undefined -> {:initalize, :ets.new(:ann_table, [:named_table])}
      table -> {:ok, table}
    end
    case :ets.lookup(:ann_table, name) do
      [{^name, value}] -> value
      [] ->
        t = pann(n-1)
        value = n - pjohn(t)
        :ets.insert(:ann_table, {name, value})
        value
    end
  end

  def sum_john(n) when n >= 1 do
    IO.puts("sum_john(#{n})")
    john(n) |> Enum.sum
  end
  def sum_ann(n) when n >= 1 do
    IO.puts("sum_ann(#{n})")
    ann(n) |> Enum.sum
  end

end
