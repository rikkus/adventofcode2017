defmodule AOC_regex do
  @group_expression ~r/\{[^\{]*\}/U
  @self_cancelling ~r/!!/
  @garbage_expression ~r/<((?<!\!)|.)+>/

  def group_count(input, total \\ 0) do
    case Enum.count(Regex.scan(@group_expression, input)) do
      0 -> total
      x -> group_count(Regex.replace(@group_expression, input, "xy"), total + x)
    end
  end

  def group_stack(input, stack \\ []) do
    case Enum.count(Regex.scan(@group_expression, input)) do
      0 ->
        stack

      x ->
        group_stack(Regex.replace(@group_expression, input, "xy"), [
          %{count: x, input: input} | stack
        ])
    end
  end

  def strip_garbage(input) do
    Regex.replace(@garbage_expression, Regex.replace(@self_cancelling, input, "<>"), "<>")
  end

  def solve(input, :one) do
    IO.puts("")
    IO.puts("----------")
    IO.puts(input)

    s =
      group_stack(strip_garbage(input))
      |> Enum.with_index()
      |> Enum.reduce(0, fn {%{count: count, input: input}, index}, sum ->
           IO.puts("#{count} * #{index + 1} #{input}")
           sum + count * (index + 1)
         end)

    IO.puts("-> #{s}")

    s
  end

  def solve(input, :two) do
  end
end