defmodule AOC do
  def solve(input, :one) do
    input
    |> String.trim
    |> String.split(~r{}, trim: true)
    |> Enum.map(&String.to_integer/1)
    |> (fn(x) -> Enum.concat(x, [hd(x)]) end).()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.filter(fn(pair) -> Enum.at(pair, 0) == Enum.at(pair, 1) end)
    |> Enum.map(fn(pair) -> Enum.at(pair, 0) end)
    |> Enum.sum
  end
end

