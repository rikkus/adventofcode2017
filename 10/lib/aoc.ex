defmodule AOC do

  def twist(list, count, [length | lengths], pos, skip) do
    IO.inspect({:twist, list, count, [length | lengths], pos, skip})
    twist_internal(list, count, [length | lengths], pos, skip)
  end

  def twist_internal(list, count, [length | lengths], pos, skip) do
    new_list = Enum.concat(list, list) |> Enum.reverse_slice(pos, length)

    new_list = cond do
      (pos + length) < count -> new_list |> Enum.take(count)
      true -> Enum.concat(Enum.slice(new_list, count, pos), Enum.slice(new_list, pos, count - pos))
    end

    case lengths do
      [] -> %{list: list, pos: pos, skip: skip}
      _ -> twist_internal(new_list, count, lengths, rem(pos + length + skip, count), skip + 1)
    end
  end

  def lengths(input, :one) do
    input |> String.trim |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)
  end

  def lengths(input, :two) do
    input |> String.trim |> String.to_charlist |> Enum.concat([17, 31, 73, 47, 23])
  end

  def solve(input, :one) when is_binary(input) do
    solve(%{list: 0..255, lengths: lengths(input, :one)}, :one)
  end

  def solve(input, :one) do
    [a, b | _] = twist(input.list, Enum.count(input.list), input.lengths, 0, 0).list
    a * b
  end

  def solve(input, :two) do
    sparse_hash = input |> lengths(:two) |> to_sparse_hash |> Map.get(:list)
    sparse_hash |> to_dense_hash |> encode
  end

  def to_sparse_hash(lengths) do
    numbers = 0..4 |> Enum.map(fn(n) -> n end)
    numbers_length = Enum.count(numbers)
    rounds = 64

    1..rounds |> Enum.reduce(
      %{list: numbers, pos: 0, skip: 0},
      fn (n, acc) ->
        l = case n do
          1 -> [3, 4, 1, 5]
          _ -> lengths
        end

        twist(acc.list, numbers_length, l, acc.pos, acc.skip)
      end
    )
  end

  def to_dense_hash(blocks) do
    blocks
    |> Enum.chunk_every(16)
    |> Enum.map(&xor/1)
  end

  def encode(list) do
    list
    |> Enum.map(
      fn(n) ->
        n
        |> Integer.to_string(16)
        |> String.pad_leading(2, "0")
        |> String.downcase
      end
    )
    |> Enum.join
  end

  def xor(list) do
    use Bitwise
    Enum.reduce(list, 0, fn(n, acc) -> n ^^^ acc end)
  end
end
