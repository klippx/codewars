defmodule Prime do

  def stream do
    Stream.unfold([], fn primes ->
      next = next_prime(primes)
      { next, [next | primes] }
    end)
  end

  def take(n) when is_integer(n), do: Enum.take(stream, n)

  def get(n) when is_integer(n), do: take(n) |> List.last

  def up_to(n) when is_integer(n) do
    stream
    |> Stream.take_while(&(&1 < n))
    |> Enum.to_list
  end

  defp next_prime([]), do: 2

  defp next_prime(primes) when is_list primes do
    primes
    |> next_primes(1)
    |> List.first
  end

  defp next_primes(primes, quantity) when is_list primes and is_integer quantity do
    from = List.first(primes) + 1
    integers(from)
    |> Stream.drop_while(fn number ->
         Enum.any?(primes, fn prime ->
           rem(number, prime) == 0
         end)
       end)
    |> Enum.take(quantity)
  end

  defp integers(n) when is_integer(n) do
    Stream.iterate(n, &(&1+1))
  end
end
