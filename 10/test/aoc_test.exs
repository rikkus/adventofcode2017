defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input %{
  list: [0, 1, 2, 3, 4],
  lengths: [3, 4, 1, 5]
}

  @year 2017
  @day 10

  @tag :skip
  test "example" do
    assert 12 == AOC.solve(@test_input, :one)
  end

  @tag :skip
  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 20056 == AOC.solve(input, :one)
  end

  test :xor do
    assert 64 == AOC.xor([65, 27, 9, 1, 4, 3, 40, 50, 91, 7, 6, 0, 2, 5, 68, 22])
  end

  test :encode do
    assert "4007ff" == AOC.encode([64, 7, 255])
  end

  test "two as one" do
    assert "" == AOC.solve(<<3, 4, 1, 5>>, :two)
  end

  @tag :skip
  test "empty" do
    assert "a2582a3a0e66e6e86e3812dcb672a272" == AOC.solve("", :two)
  end

  @tag :skip
  test "AoC 2017" do
    assert "33efeb34ea91902bb2f59c9920caa6cd" == AOC.solve("AoC 2017", :two)
  end

  @tag :skip
  test "1,2,3" do
    assert "3efbe78a8d82f29979031a4aa0b16a9d" == AOC.solve("1,2,3", :two)
  end

  @tag :skip
  test "1,2,4" do
    assert "63960835bcdc130f0b66d7ff4f6a5a8e" == AOC.solve("1,2,4", :two)
  end

  @tag :skip
  @tag timeout: 6000000
  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert :mu == AOC.solve(input, :two)
  end
end
