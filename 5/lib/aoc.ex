defmodule AOC do

  def solve(input, part) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Map.new(fn(x) -> {elem(x, 1), elem(x, 0)} end)
    #|> print_state(0)
    |> jmp(0, 0, part)
  end

  def jmp(input, steps, pc, part) do
    cond do
      pc >= Enum.count(input) -> steps
      pc < 0 -> steps
      true -> 
        {offset, new_input} = Map.get_and_update!(
          input,
          pc,
          fn(v) ->
            {
              v,
              v + cond do
                part == :two && v >= 3 -> -1
                true -> 1
              end
            }
          end
        )
        new_pc = pc + offset
        # print_state(new_input, new_pc)
        jmp(new_input, steps + 1, new_pc, part)
    end
  end

  def print_state(input, pc) do
    Enum.sort_by(input, fn(x) -> elem(x, 0) end)
    |> Enum.map(
      fn(x) ->
        c = case elem(x, 0) == pc do
          true -> '|'
          false -> ' '
        end
        "#{c}#{elem(x, 1)}#{c}"
      end
    )
    |> Enum.join(" ")
    |> IO.puts
    input
  end
end

