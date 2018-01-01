defmodule Speedo do
  import ExProf.Macro

  def prof do
    profile do
      {:ok, input} = AdventOfCodeHelper.get_input(2017, 13)
      AOC.start_trying_to_solve(input, :two)
    end
  end

  def run do
    records = prof()
    total_percent = Enum.reduce(records, 0.0, &(&1.percent + &2))
    IO.inspect "total = #{total_percent}"
  end
end

