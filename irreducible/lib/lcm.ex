defmodule Lcm do
  @doc """
  Finds the smallest common denominator for a list of fractions

  ## Examples

      iex> Lcm.mgn([2, 3, 4])
      12

  """
  def mgn(lst) do
    find_mgn(lst, 2, 1)
  end

  defp find_mgn(lst, div, acc) do
    if Enum.any?(lst, &(&1 != 1)) do
      if Enum.any?(lst, &(rem(&1, div) == 0)) do
        divide_all_evenly(lst, div)
        |> find_mgn(div, acc*div)
      else
        case div do
          2 -> find_mgn(lst, 3, acc)
          _ -> find_mgn(lst, div+2, acc)
        end
      end
    else
      acc
    end
  end

  defp divide_all_evenly(lst, curr) do
    Enum.map(lst, fn(x) ->
      if rem(x, curr) == 0 do
        div(x, curr)
      else
        x
      end
    end)
  end
end
