defmodule AOC do
  def parse(
        [x | xs],
        in_comment \\ false,
        depth \\ 0,
        total \\ 0,
        comment_total \\ 0,
        output \\ []
      ) do
    # IO.puts "#{output} | #{x} | #{xs} -- depth: #{depth}, total: #{total}, in_comment: #{in_comment}"
    case x do
      "" ->
        %{total: total, comment_total: comment_total}

      "!" ->
        parse(tl(xs), in_comment, depth, total, comment_total, [output | x])

      ">" when in_comment ->
        parse(xs, false, depth, total, comment_total, [output | x])

      "<" when in_comment == false ->
        parse(xs, true, depth, total, comment_total, [output | x])

      "{" when in_comment == false ->
        parse(xs, in_comment, depth + 1, total, comment_total, [output | x])

      "}" when in_comment == false ->
        parse(xs, in_comment, depth - 1, total + depth, comment_total, [output | x])

      c when in_comment == false ->
        parse(xs, in_comment, depth, total, comment_total, [output | c])

      c ->
        parse(xs, in_comment, depth, total, comment_total + 1, [output | c])
    end
  end

  def solve(input, :one) do
    parse(String.split(input, "")).total
  end

  def solve(input, :two) do
    parse(String.split(input, "")).comment_total
  end
end