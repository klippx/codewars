defmodule Prime do

  def take(n) when is_integer(n), do: Enum.take(stream, n)

  defp stream do
    Stream.unfold([], fn primes ->
      next = next_prime(primes)
      { next, [next | primes] }
    end)
  end

  defp next_prime([]), do: 2
  defp next_prime(primes) when is_list primes do
    List.first(primes) + 1
    |> Stream.iterate(&(&1+1))
    |> Stream.drop_while(&(is_divisible?(&1, primes)))
    |> Enum.take(1)
    |> List.first
  end

  defp is_divisible?(number, primes) when is_list primes and is_integer number do
    Enum.any?(primes, fn prime ->
      rem(number, prime) == 0
    end)
  end
end
