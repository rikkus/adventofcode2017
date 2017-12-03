defmodule AOC do

  def list_of_list_of_numbers(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(
      fn(line) ->
        String.split(line, ~r{\s}, trim: true)
        |> Enum.map(&String.to_integer/1)
      end
    )
  end

  def solve(input, :one) do
    list_of_list_of_numbers(input)
    |> Enum.map(fn(numbers) -> Enum.max(numbers) - Enum.min(numbers) end)
    |> Enum.sum
  end

  def solve(input, :two) do
    list_of_list_of_numbers(input)
    |> Enum.map(fn(numbers) -> division_result(numbers) end)
    |> Enum.sum
  end

  def division_result(numbers) do
    numbers
    |> Combination.combine(2)
    |> Enum.map(fn(pair) -> Enum.sort(pair) |> Enum.reverse end)
    |> Enum.filter(fn(pair) -> rem(Enum.at(pair, 0), Enum.at(pair, 1)) == 0 end)
    |> Enum.map(fn(pair) -> div(Enum.at(pair, 0), Enum.at(pair, 1)) end)
    |> Enum.at(0)
  end

end

