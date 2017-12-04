defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @year 2017
  @day 3
  @part_one_expected 326
  @part_two_expected nil

  test "example part one 1" do
    assert AOC.solve(1, :one) == 0
  end

  test "example part one 12" do
    assert AOC.solve(12, :one) == 3
  end

  test "example part one 23" do
    assert AOC.solve(23, :one) == 2
  end

  test "example part one 1024" do
    assert AOC.solve(1024, :one) == 31
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert AOC.solve(elem(Integer.parse(String.trim(input)), 0), :one) == @part_one_expected
  end

  test "example part two 1" do
    assert AOC.solve(1, :two) == 1
  end

  test "example part two 2" do
    assert AOC.solve(2, :two) == 1
  end

  test "example part two 3" do
    assert AOC.solve(3, :two) == 2
  end

  test "example part two 4" do
    assert AOC.solve(4, :two) == 4
  end

  test "example part two 5" do
    assert AOC.solve(5, :two) == 5
  end

  @tag :skip
  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert AOC.solve(elem(Integer.parse(String.trim(input)), 0), :two) == @part_two_expected
  end
end
