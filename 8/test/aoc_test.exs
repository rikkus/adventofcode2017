defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
" |> String.trim 

  @year 2017
  @day 8

  @tag :skip
  test "example" do
    assert AOC.solve(@test_input, :one) == 1
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 4832 == AOC.solve(input) |> elem(0)
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert :mu == AOC.solve(input) |> elem(1)
  end
end
