defmodule Lcm do
  @doc """
  Finds the smallest common denominator for a list of fractions

  ## Examples

      iex> Lcm.mgn([2, 3, 4])
      12

  """
  def mgn(lst) do
    find(lst, 2, 1)
  end

  defp find(lst, curr, acc) do
    if Enum.all?(lst, fn(x) -> x == 1 end) do
      acc
    else
      if Enum.any?(lst, fn(x) -> rem(x, curr) == 0 end) do
        find(Enum.map(lst, fn(x) ->
          if rem(x, curr) == 0 do
            div(x, curr)
          else
            x
          end
        end), curr, acc*curr)
      else
        if (curr == 2) do
          find(lst, curr+1, acc)
        else
          find(lst, curr+2, acc)
        end
      end
    end
  end
end
