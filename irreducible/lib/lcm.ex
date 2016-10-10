defmodule Lcm do
  @doc """
  Finds the smallest common denominator for a list of fractions

  ## Examples

      iex> Lcm.mgn([2, 3, 4])
      12

  """
  def mgn(lst) do
    greatest = lst |> Enum.max
    find(lst, greatest, greatest)
  end

  defp find(lst, inc, curr) do
    # IO.puts "Current: #{curr}, increment: #{inc}"
    # Enum.map(lst, fn x -> "#{x}" end)
    # |> Enum.join(", ")
    # |> IO.puts

    if found?(lst, curr) do
      curr
    else
      find(lst, inc, curr + inc)
    end
  end
  defp found?(lst, curr), do: Enum.all?(lst, fn x -> rem(curr, x) == 0 end)
end
