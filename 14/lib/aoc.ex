defmodule AOC do
  def solve(input, :one) do
    0..127
    |> Enum.map(fn(n) ->
      (
      s = "flqrgnkx-" <> Integer.to_string(n)
      {s, dense_hash(s)}
    )
    end)
  end
  def solve(input, :two) do
    :error
  end

  def twist(list, count, [length | lengths], pos, skip) do
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

  def lengths(input) do
    input |> String.trim |> String.to_charlist |> Enum.concat([17, 31, 73, 47, 23])
  end

  def dense_hash(input) do
    sparse_hash = input |> lengths |> to_sparse_hash |> Map.get(:list)
    sparse_hash |> to_dense_hash |> encode
  end

  def to_sparse_hash(lengths) do
    numbers = 0..255 |> Enum.map(fn(n) -> n end)
    numbers_length = Enum.count(numbers)
    rounds = 64

    1..rounds |> Enum.reduce(
      %{list: numbers, pos: 0, skip: 0},
      fn (n, acc) ->
        twist(acc.list, numbers_length, lengths, acc.pos, acc.skip)
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