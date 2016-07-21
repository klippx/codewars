defmodule PalindromicPrimes do

  def palprimes(n) do
    stream |> Enum.take(n)
  end

  defp stream do
    Stream.unfold([], &(find_next_pal_prime(&1)))
  end

  defp find_next_pal_prime(pal_primes) do
    next = next_prime(pal_primes)
    if palindrome?(next) do
      { next, [next | pal_primes] }
    else
      find_next_pal_prime([next | pal_primes])
    end
  end

  defp next_prime([]), do: 2
  defp next_prime(primes) when is_list primes do
    List.first(primes) + 1
    |> Stream.iterate(&(&1+1))
    |> Stream.drop_while(&(is_divisible?(&1, primes)))
    |> Enum.take(1)
    |> List.first
  end

  defp palindrome?(number) when is_integer number do
    string = Integer.to_string(number)
    string == String.reverse(string)
  end

  defp is_divisible?(number, primes) when is_list primes and is_integer number do
    Enum.any?(primes, fn prime ->
      rem(number, prime) == 0
    end)
  end
end
