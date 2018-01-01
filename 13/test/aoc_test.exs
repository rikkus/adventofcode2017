defmodule AOCTest do
  use ExUnit.Case
  import ExProf.Macro
  doctest AOC

@test_input "
0: 3
1: 2
4: 4
6: 4
" |> String.trim 

  @year 2017
  @day 13

  test "example" do
    assert 24 == AOC.solve(@test_input, :one)
  end

  test "part one" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
    assert 1316 == AOC.solve(input, :one)
  end

  test "part two" do
    {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
  end

  def prof do
    profile do
      {:ok, input} = AdventOfCodeHelper.get_input(@year, @day)
      AOC.solve(input, :two)
    end
  end

  def run do
    records = prof
    total_percent = Enum.reduce(records, 0.0, &(&1.percent + &2))
    IO.inspect "total = #{total_percent}"
  end
end
