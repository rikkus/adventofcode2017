defmodule AOC do

  def captcha(digits, offset) do
    count = Enum.count(digits)
    digits
    |> Enum.with_index()
    |> Enum.filter(fn({n, index}) -> n == Enum.at(digits, rem(offset + index + 1, count)) end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.sum
  end

end
