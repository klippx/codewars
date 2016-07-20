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
    primes
    |> next_primes(1)
    |> List.first
  end

  defp next_primes(primes, quantity) when is_list primes and is_integer quantity do
    List.first(primes) + 1
    |> Stream.iterate(&(&1+1))
    |> Stream.drop_while(&(not_palindrome?(&1) || is_divisible?(&1, primes)))
    |> Enum.take(quantity)
  end

  defp is_divisible?(number, primes) when is_list primes and is_integer number do
    Enum.any?(primes, fn prime ->
      rem(number, prime) == 0
    end)
  end

  defp not_palindrome?(number) when is_integer number do
    string = Integer.to_string(number)
    string != String.reverse(string)
  end
end
