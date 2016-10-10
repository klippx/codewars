defmodule Sumfracts do

  def sum_fracts(lst) do
    mgn = mgn(lst)
    lst
    |> convert(mgn)
    |> sum(mgn)
    |> simplify
  end

  @doc """
  Convert the list to be on common denominator

  ## Examples

      iex> Sumfracts.convert([{1, 2}, {1, 3}, {1, 4}], 12)
      [{6, 12}, {4, 12}, {3, 12}]

  """
  def convert(lst, mgn), do: Enum.map(lst, fn {a,b} -> {a*div(mgn, b), b*div(mgn, b)} end)

  @doc """
  Sums the numerators and denominators and returns the result.

  ## Examples

      iex> Sumfracts.sum([{6, 12}, {4, 12}, {3, 12}], 12)
      {13, 12}

  """
  def sum(lst, mgn), do: { Enum.reduce(lst, 0, fn {a,_}, acc -> acc+a end), mgn }

  @doc """
  Sums the numerators and denominators and returns the result.

  ## Examples

      iex> Sumfracts.simplify({6,2})
      3

      iex> Sumfracts.simplify({13,12})
      {13, 12}

  """
  def simplify({a,b}) when rem(a, b) == 0, do: div(a,b)
  def simplify({a,b}), do: {a,b}

  @doc """
  Finds the smallest common denominator for a list of fractions

  ## Examples

      iex> Sumfracts.mgn([{1, 2}, {1, 3}, {1, 4}])
      12

  """
  def mgn(lst) do
    denoms = lst |> Enum.map(fn {_,b} -> b end)
    greatest = denoms |> Enum.max
    find_mgn(denoms, greatest, greatest)
  end

  defp find_mgn(denoms, greatest, current) do
    if Enum.all?(denoms, fn x -> rem(current, x) == 0 end) do
      current
    else
      find_mgn(denoms, greatest, current + greatest)
    end
  end
end
