defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @year 2017
  @day 11

  @tag :skip
  test "1" do
    assert 3 == AOC.solve("ne,ne,ne", :one)
  end

  test "2" do
    assert 0 == AOC.solve("ne,ne,sw,sw", :one)
  end

  test "3" do
    assert 2 == AOC.solve("ne,ne,s,s", :one)
  end

  test "4" do
    assert 3 == AOC.solve("se,sw,se,sw,sw", :one)
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 682 == AOC.solve(input, :one)
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 1406 == AOC.solve(input, :two)
  end
end
