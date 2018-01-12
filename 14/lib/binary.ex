defmodule Binary do

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

end