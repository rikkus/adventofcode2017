defmodule AOC do

  def is_valid(line, :one) do
    tokens = String.split(line)
    tokens == Enum.uniq(tokens)
  end

  def is_valid(line, :two) do
    tokens = String.split(line) |> Enum.map(fn(s) -> Enum.sort(String.graphemes(s)) end)
    tokens == Enum.uniq(tokens)
  end

  def solve(input, part) do
    String.split(input, "\n", trim: true)
    |> Enum.filter(fn(line) -> is_valid(line, part) end)
    |> Enum.count
  end

end

