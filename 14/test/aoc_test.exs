defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @year 2017
  @day 14

  test "binary" do
    assert "10100000" == Binary.to_binary(0xa0)
  end
  
  test "bit count" do
    assert 3 == Binary.bit_count(0b10100010)
    assert 1 == Binary.bit_count(0b1)
    assert 0 == Binary.bit_count(0b0)
    assert 5 == Binary.bit_count(0b1010001010010000)
  end

  test "bit count list" do
    assert 3 == Binary.bit_count([0b10100000, 0b00000001])
  end

  test "flqrgnkx" do
    assert 0b11010100 == KnotHash.hash("flqrgnkx-0") |> List.first
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 8292 == AOC.solve(String.trim(input), :one)
  end

  @tag :skip
  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert :mu == AOC.solve(String.trim(input), :two)
  end
end
