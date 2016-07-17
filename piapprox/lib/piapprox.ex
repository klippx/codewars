defmodule Piapprox do

  def iter_pi(epsilon) do
    Enum.reduce_while(leibniz_stream, 0, fn i, acc ->
      if abs(:math.pi/4 - acc) > epsilon, do: {:cont, acc + i}, else: {:halt, acc}
    end)
  end

  defp leibniz_stream do
    Stream.unfold(1, fn
      n when rem(n,4) == 1 -> { 1/n, n+2 }
      n                    -> {-1/n, n+2 }
    end)
  end
end
