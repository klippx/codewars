defmodule Sumfracts do

  def sum_fracts([]), do: nil
  def sum_fracts(lst) do
    # Enum.map(lst, fn {a,b} -> "{#{a}, #{b}}" end)
    # |> Enum.join(", ")
    # |> IO.puts
    mgn = lst
    |> denoms
    |> Lcm.mgn

    lst
    |> convert(mgn)
    |> sum(mgn)
    |> simplify
  end
  defp denoms(lst), do: lst |> Enum.map(fn {_,b} -> b end)

  @doc """
  Convert the list to be on common denominator

  ## Examples

      iex> Sumfracts.convert([{1, 2}, {1, 3}, {1, 4}], 12)
      [{6, 12}, {4, 12}, {3, 12}]

  """
  def convert(lst, mgn), do: Enum.map(lst, fn {a,b} -> n=div(mgn, b); {a*n, b*n} end)

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

      iex> Sumfracts.simplify({33152, 16770})
      {16576, 8385}

      iex> Sumfracts.simplify({45885, 34060})
      {9177, 6812}

  """
  def simplify({a,b}) when rem(a, b) == 0, do: div(a,b)
  def simplify({a,b}) when rem(a,2) == 0 and rem(b,2) == 0, do: simplify({div(a,2), div(b,2)})
  def simplify({a,b}) when rem(a,5) == 0 and rem(b,5) == 0, do: simplify({div(a,5), div(b,5)})
  def simplify({a,b}), do: {a,b}

end
