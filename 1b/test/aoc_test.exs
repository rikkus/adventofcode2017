defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
" |> String.trim 

  @year 2017
  @day 1

  test "1122 should be 3" do
    assert 3 == AOC.solve("1122", :one)
  end

  test "1111" do
    assert 4 == AOC.solve("1111", :one)
  end

  test "1234" do
    assert 0 == AOC.solve("1234", :one)
  end

  test "91212129" do
    assert 9 == AOC.solve("91212129", :one)
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 1141 == AOC.solve(input, :one)
  end

  @tag :skip
  @tag timeout: 6000000
  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert :mu == AOC.solve(input) |> elem(1)
  end
end
