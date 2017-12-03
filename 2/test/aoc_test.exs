defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @year 2017
  @day 2
  @example_part_one_expected 18
  @part_one_expected 48357
  @example_part_two_expected 9
  @part_two_expected 351

@part_one_test_input "
5 1 9 5
7 5 3
2 4 6 8
" |> String.trim 

@part_two_test_input "
5 9 2 8
9 4 7 3
3 8 6 5
" |> String.trim 

  test "example part one" do
    assert AOC.solve(@part_one_test_input, :one) == @example_part_one_expected
  end

  test "example part two" do
    assert AOC.solve(@part_two_test_input, :two) == @example_part_two_expected
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert AOC.solve(input, :one) == @part_one_expected
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert AOC.solve(input, :two) == @part_two_expected
  end
end
