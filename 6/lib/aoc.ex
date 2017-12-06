defmodule AOC do

  def redistribute(input) do
    {max, max_offset} = Enum.with_index(input) |> Enum.max_by(fn({n, _}) -> n end)
    redistribute(List.replace_at(input, max_offset, 0), max, max_offset + 1)
  end

  def redistribute(input, 0, offset) when is_integer(offset), do: input
  def redistribute(input, n, offset) when is_integer(offset) do
    offset = rem(offset, Enum.count(input))
    input = List.replace_at(input, offset, Enum.at(input, offset) + 1)
    redistribute(input, n - 1, offset + 1)
  end

  def redistribute(input, count, seen) when is_map(seen) do
    new_input = redistribute(input)
    count = count + 1
    case MapSet.member?(seen, new_input) do
      true -> {new_input, count}
      false -> redistribute(new_input, count, MapSet.put(seen, new_input))
    end
  end

  def solve(input, :one) do
    {new_input, count} = redistribute(input, 0, MapSet.new([input]))
    count
  end

  def solve(input, :two) do
    {new_input, count} = redistribute(input, 0, MapSet.new([input]))
    {_, count} = redistribute(new_input, 0, MapSet.new([new_input]))
    count
  end
end

