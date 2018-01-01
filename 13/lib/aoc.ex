defmodule AOC do
  def parse(input) do
    input
    |> String.trim
    |> String.split("\n")
    |> Enum.map(
      fn(line) ->
        String.split(line, ~r{\:\s+})
        |> Enum.map(&String.to_integer/1) |> List.to_tuple
      end
    )
    |> Map.new
  end

  def score(depth, range) do
    case range do
      nil -> 0
      _ -> if rem(depth, range * 2 - 2) == 0 do
          depth * range
        else
          0
        end
    end
  end

  def total_score(input, delay \\ 0) do
    max_depth = Map.keys(input) |> Enum.max
    Enum.reduce(
      0..max_depth,
      0,
      fn(depth, acc) -> acc + score(delay + depth, Map.get(input, depth)) end
    )
  end

  def solve(input, :one) do
    input = parse(input)
    total_score(input)
  end

  def solve(input, :two) do
    input = parse(input)
    Enum.find(0..999_999_999, fn(n) -> total_score(input, n) == 0 end)
  end
  
  def start_trying_to_solve(input, :two) do
    input = parse(input)
    Enum.find(0..99_999, fn(n) -> total_score(input, n) == 0 end)
  end
end

