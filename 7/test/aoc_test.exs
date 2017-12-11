defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  @year 2017
  @day 7

@test_input "
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
" |> String.trim 

  test "example" do
    assert AOC.solve(@test_input, :one) == "tknk"
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert AOC.solve(input, :one) == "qibuqqg"
  end

  test "example two" do
    assert AOC.solve(@test_input, :two) == 60
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert AOC.solve(input, :two) == nil
  end
end
