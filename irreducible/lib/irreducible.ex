defmodule Sumfracts do

  def sum_fracts(lst) do
    mgn = mgn(lst)
    lst
    |> convert(mgn)
    |> sum(mgn)
    |> simplify
  end

  def convert(lst, mgn) do
    Enum.map(lst, fn {a,b} ->
      n = div mgn, b
      {a*n, b*n}
    end)
  end

  def sum(lst, mgn) do
    {Enum.reduce(lst, 0, fn {a,_}, acc ->
      acc+a
    end), mgn}
  end

  def simplify({a,b}) do
    if rem(a, b) == 0 do
      div a,b
    else
      {a,b}
    end
  end

  # [2, 3, 4] => 12
  def mgn(lst) do
    denoms = lst |> Enum.map(fn {_,b} -> b end)
    greatest = denoms |> Enum.max
    find_mgn(denoms, greatest, greatest)
  end

  def find_mgn(denoms, greatest, current) do
    if Enum.all?(denoms, fn x -> rem(current, x) == 0 end) do
      current
    else
      find_mgn(denoms, greatest, current + greatest)
    end
  end
end
