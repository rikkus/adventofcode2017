defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
" |> String.trim 

  @year 2017
  @day 4
  @part_one_expected 455
  @part_two_expected 186

  test "example 1::1" do
    assert AOC.solve("aa bb cc dd ee", :one) == 1
  end

  test "example 1::2" do
    assert AOC.solve("aa bb cc dd aa", :one) == 0
  end

  test "example 1::3" do
    assert AOC.solve("aa bb cc dd aaa", :one) == 1
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
