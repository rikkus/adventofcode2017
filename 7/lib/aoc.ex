defmodule AOC do
  def parse_line(line) do
    captures = Regex.named_captures(~r/(?<node>[a-z]+)\s\((?<weight>\d+)\)(\s->\s(?<children>(([a-z]+)(,\s)?)+))?/, line)

    %{
      node: captures["node"],
      weight: String.to_integer(captures["weight"]),
      children: String.split(captures["children"], ", ", trim: true)
    }
  end

  def add_vertices(graph, node_specs) do
    Enum.map_reduce(node_specs, graph, fn (node, g) -> {
        nil,
        Graph.add_vertex(g, node.node, %{name: node.node, w: node.weight, W: node.weight})
      }
    end)
    |> elem(1)
  end

  def add_edges(graph, node_specs) do
    Enum.map_reduce(node_specs, graph, fn (node, g) -> {
        nil,
        Graph.add_edges(g, Enum.map(node.children, fn (child) -> {node.node, child} end))
      }
    end)
    |> elem(1)
  end

  def to_graph(input) do
    node_specs = input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)

    Graph.new
    |> add_vertices(node_specs)
    |> add_edges(node_specs)
  end

  def total_weight(graph, node) do
    graph |> Graph.vertex_label(node) |> Map.get(:W)
  end

  def weight(graph, node) do
    graph |> Graph.vertex_label(node) |> Map.get(:w)
  end

  def calculate_total_weights(graph, []) do
    graph
  end

  def calculate_total_weights(graph, postorder_nodes) do
    node = hd(postorder_nodes)

    before = Graph.vertex_label(graph, node)

    total_weight = Graph.out_neighbors(graph, node)
      |> Enum.reduce(total_weight(graph, node), fn(x, sum) -> sum + total_weight(graph, x) end)

    graph = Graph.label_vertex(graph, node, %{name: before.name, w: before.w, W: total_weight})

    calculate_total_weights(graph, tl(postorder_nodes))
  end

  def find_new_weight_required_to_balance(graph, node, new_weight) do
    weight_map = Graph.out_neighbors(graph, node)
      |> Enum.group_by(fn(neighbor) -> total_weight(graph, neighbor) end)

    modal = Enum.find(weight_map, fn(x) -> Enum.count(elem(x, 1)) > 1 end)

    case modal do
      nil -> {node, new_weight}
      {modal_weight, modal_nodes} -> 
        outlier = Enum.find(weight_map, fn(x) -> Enum.count(elem(x, 1)) == 1 end)
        case outlier do
          nil -> {node, new_weight}
          {outlier_weight, [outlier_node]} ->
            new_weight = weight(graph, outlier_node) + (modal_weight - total_weight(graph, outlier_node))
            find_new_weight_required_to_balance(graph, outlier_node, new_weight)
        end
    end

  end

  def solve(input, :one) do
    Graph.arborescence_root(to_graph(input))
  end

  def solve(input, :two) do
    g = to_graph(input)
    g = calculate_total_weights(g, Graph.postorder(g))
    # IO.puts Graph.to_dot(g) |> elem(1)
    {node, new_weight} = find_new_weight_required_to_balance(g, Graph.arborescence_root(g), 0)
    # IO.inspect {node, new_weight}
    new_weight
  end
end

