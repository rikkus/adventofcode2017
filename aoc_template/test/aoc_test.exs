defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
" |> String.trim 

  @year 2017
  @day :mu

  @tag :skip
  test "example" do
    assert :mu == AOC.solve(@test_input, :one)
  end

  @tag :skip
  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert :mu == AOC.solve(input)
  end

  @tag :skip
  @tag timeout: 6000000
  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert :mu == AOC.solve(input) |> elem(1)
  end
end
