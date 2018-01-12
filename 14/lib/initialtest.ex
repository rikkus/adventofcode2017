defmodule InitialTest do

  def loop(n, initial_state, function) do
    Enum.reduce(0..n, initial_state, fn _, state -> function.(state) end)
  end

  @default_input Enum.to_list(0..255)


  def solve(input, :one) do
    0..127
    |> Enum.map(fn n -> row_hash(input, n) |> bit_count end)
    |> Enum.sum
  end

  def row_hash(s, n) do
    row_input(s, n)
    |> hash
  end

  def row_input(s, n), do: s <> "-" <> Integer.to_string(n)

  def bit_count(l) when is_list(l) do
    l
    |> Enum.map(&bit_count/1)
    |> Enum.sum()
  end

  def bit_count(n) when is_number(n) do
    for(<<bit::1 <- :binary.encode_unsigned(n)>>, do: bit)
    |> Enum.sum()
  end

  def to_binary(n) do
    n
    |> Integer.to_string(2)
    |> String.pad_leading(8, "0")
  end

  def hash(s) do
    s
    |> String.to_charlist()
    |> Enum.concat([17, 31, 73, 47, 23])
    |> to_sparse_hash
    |> to_dense_hash
  end

  def hash(key, input, index, skip) do
    Enum.reduce(input, {key, index, skip}, &knot/2)
  end

  def knot(length, {key, index, skip}) do
    key = twist(key, index, length)
    {key, rem(index + length + skip, length(key)), skip + 1}
  end

  def twist(key, index, length) do
    {a, b} = Enum.split(key, index)
    {a, b} = Enum.split(b ++ a, length)
    {a, b} = Enum.split(Enum.reverse(a) ++ b, length(key) - index)
    b ++ a
  end

  def to_sparse_hash(key, input \\ @default_input) do
    IO.inspect {:to_sparse_hash, key}
    64
    |> loop({input, 0, 0}, fn {output, index, skip} -> hash(key, output, index, skip) end)
    |> elem(0)
  end

  def to_dense_hash(blocks) do
    IO.inspect {:to_dense_hash, blocks}
    x = blocks
    |> Enum.chunk_every(16)
    |> Enum.map(&xor/1)
    IO.inspect {:to_dense_hash_output, x}
    x
  end

  def xor(list) do
    use Bitwise
    Enum.reduce(list, 0, fn n, acc -> n ^^^ acc end)
  end
end
