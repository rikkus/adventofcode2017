defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

@test_input "
0
3
0
1
-3
" |> String.trim 

  @year 2017
  @day 5
  @part_one_expected 355965
  @part_two_expected 26948068

  test "example" do
    assert AOC.solve(@test_input, :one) == 5
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
