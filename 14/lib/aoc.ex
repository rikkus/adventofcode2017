defmodule AOC do


  def solve(input, :one) do
    0..127
    |> Enum.map(fn n -> row_hash(input, n) |> Binary.bit_count end)
    |> Enum.sum
  end

  def row_hash(s, n) do
    row_input(s, n)
    |> hash
  end

  def row_input(s, n), do: s <> "-" <> Integer.to_string(n)

  def hash(s) do
    s
    |> String.to_charlist()
    |> Enum.concat([17, 31, 73, 47, 23])
    |> KnotHash.to_sparse_hash
    |> elem(0)
    |> KnotHash.to_dense_hash
  end

end