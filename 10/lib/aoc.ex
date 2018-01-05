defmodule AOC do
  @default_input Enum.to_list(0..255)

  def hash(input, key, index, skip) do
    input |> Enum.reduce({key, index, skip}, &knot/2)
  end

  def reverse({a, b}) do
    b ++ a
  end

  def twist(key, index, length) do
    {a, b} = key |> Enum.split(index)
    {a, b} = b ++ a |> Enum.split(length)
    {a, b} = Enum.reverse(a) ++ b |> Enum.split(length(key) - index)
    b ++ a
  end

  def knot(length, {key, index, skip}) do
    key = twist(key, index, length)
    {key, rem(index + length + skip, length(key)), skip + 1}
  end

  def solve(input, key, :one) do
    [a, b | _] = hash(input, key, 0, 0) |> elem(0)
    a * b
  end

  def solve(key, :one) do
    solve(key |> String.split(",") |> Enum.map(&String.to_integer/1), @default_input, :one)
  end

  def solve(key, :two) do
    key
    |> String.to_charlist
    |> Enum.concat([17, 31, 73, 47, 23])
    |> to_sparse_hash
    |> elem(0)
    |> to_dense_hash
    |> encode
  end

  def to_sparse_hash(key) do
    1..64 |> Enum.reduce(
      {@default_input, 0, 0},
      fn (_, {input, index, skip}) -> hash(key, input, index, skip) end
    )
  end

  def to_hex(n) do
    n
    |> Integer.to_string(16)
    |> String.pad_leading(2, "0")
    |> String.downcase
  end

  def to_dense_hash(blocks) do
    blocks
    |> Enum.chunk_every(16)
    |> Enum.map(&xor/1)
  end

  def encode(list) do
    list
    |> Enum.map(&to_hex/1)
    |> Enum.join
  end

  def xor(list) do
    use Bitwise
    Enum.reduce(list, 0, fn(n, acc) -> n ^^^ acc end)
  end
end
