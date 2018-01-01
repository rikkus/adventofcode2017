defmodule AOC do
  def create_graph(input) do
    input
    |> String.trim
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.reduce(Graph.new(type: :undirected),
      fn(spec, g1) ->
        Enum.reduce(spec.others, g1, fn(other, g2) -> Graph.add_edge(g2, spec.node, other) end)
      end
    )
  end

  def solve(input, :one) do
    create_graph(input) |> Graph.components |> Enum.filter(fn(l) -> Enum.member?(l, 0) end) |> Enum.at(0) |> Enum.count
  end

  def solve(input, :two) do
    create_graph(input) |> Graph.components |> Enum.count
  end

  def parse_line(line) do
    [node, others] = line
    |> String.trim
    |> String.split("<->")
    node = node |> String.trim |> String.to_integer
    others = String.split(others, ",") |> Enum.map(&String.trim/1) |> Enum.map(&String.to_integer/1)
    %{node: node, others: others}
  end
end

