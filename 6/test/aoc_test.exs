defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @test_input "0 2 7 0" |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
  @input "0	5	10	0	11	14	13	4	11	8	8	7	1	4	12	11" |> String.split |> Enum.map(&String.to_integer/1)

  @example_expected 5
  @example_part_two_expected 4
  @part_one_expected 7864
  @part_two_expected 1695

  @tag :skip
  test "example" do
    assert AOC.solve(@test_input, :one) == @example_expected
  end

  test "example part two" do
    assert AOC.solve(@test_input, :two) == @example_part_two_expected
  end

  test "part one" do
    assert AOC.solve(@input, :one) == @part_one_expected
  end

  test "part two" do
    assert AOC.solve(@input, :two) == @part_two_expected
  end
end
