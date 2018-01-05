defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @year 2017
  @day 10

  test "example" do
    assert 12 == AOC.solve([3, 4, 1, 5], [0, 1, 2, 3, 4], :one)
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 20056 == AOC.solve(String.trim(input), :one)
  end

  test :xor do
    assert 64 == AOC.xor([65, 27, 9, 1, 4, 3, 40, 50, 91, 7, 6, 0, 2, 5, 68, 22])
  end

  test :encode do
    assert "4007ff" == AOC.encode([64, 7, 255])
  end

  test "empty" do
    assert "a2582a3a0e66e6e86e3812dcb672a272" == AOC.solve("", :two)
  end

  test "AoC 2017" do
    assert "33efeb34ea91902bb2f59c9920caa6cd" == AOC.solve("AoC 2017", :two)
  end

  test "1,2,3" do
    assert "3efbe78a8d82f29979031a4aa0b16a9d" == AOC.solve("1,2,3", :two)
  end

  test "1,2,4" do
    assert "63960835bcdc130f0b66d7ff4f6a5a8e" == AOC.solve("1,2,4", :two)
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert "d9a7de4a809c56bf3a9465cb84392c8e" == AOC.solve(String.trim(input), :two)
  end
end
