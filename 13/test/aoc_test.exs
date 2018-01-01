defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
0: 3
1: 2
4: 4
6: 4
" |> String.trim 

  @year 2017
  @day 13

  test "example" do
    assert 24 == AOC.solve(@test_input, :one)
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 1316 == AOC.solve(input, :one)
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 3840052 == AOC.solve(input, :two)
  end
end
