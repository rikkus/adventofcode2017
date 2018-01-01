defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5
" |> String.trim 

  @year 2017
  @day 12

  test "example" do
    assert 6 == AOC.solve(@test_input, :one)
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 130 == AOC.solve(input, :one)
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 189 == AOC.solve(input, :two)
  end
end
