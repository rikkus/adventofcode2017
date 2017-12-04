defmodule AOC do

  def manhattan_distance_from_origin({x, y}) do
    abs(x) + abs(y)
  end

  def foo({x, y}, {nx, ny}, {xrem, yrem}, {dx, dy}, n, target, steps) do
    steps = Map.put(steps, {x, y}, n)

    #print(steps)
    #IO.inspect {:foo, %{pos: {x, y}, next: {nx, ny}, rem: {xrem, yrem}, d: {dx, dy}, n: n, target: target}}
    case n == target do
      true -> {{x, y}, steps}
      false -> next_pos({x, y}, {nx, ny}, {xrem, yrem}, {dx, dy}, n + 1, target, steps)
    end
  end

  # We've run out on this leg. Let's turn the corner.

  def next_pos({x, y}, {nx, ny}, {0, 0}, {0, -1}, n, target, steps) do
    #IO.inspect "We were going up. Let's go left now."
    foo {x, y - 1}, {nx, ny + 1}, {nx, 0}, {-1, 0}, n, target, steps
  end

  def next_pos({x, y}, {nx, ny}, {0, 0}, {-1, 0}, n, target, steps) do
    #IO.inspect "We were going left. Let's go down now."
    foo {x - 1, y}, {nx + 1, ny}, {0, ny}, {0, 1}, n, target, steps
  end

  def next_pos({x, y}, {nx, ny}, {0, 0}, {0, 1}, n, target, steps) do
    #IO.inspect "We were going down. Let's go right now."
    foo {x, y + 1}, {nx, ny + 1}, {nx, 0}, {1, 0}, n, target, steps
  end

  def next_pos({x, y}, {nx, ny}, {0, 0}, {1, 0}, n, target, steps) do
    #IO.inspect "We were going right. Let's go up now."
    foo {x + 1, y}, {nx + 1, ny}, {0, ny}, {0, -1}, n, target, steps
  end

  # We're just counting down - so let's continue, after subtracting one.

  def next_pos({x, y}, {nx, ny}, {xrem, 0}, {dx, dy}, n, target, steps) do
    #IO.inspect "We were going {#{dx}, #{dy}}. Let's continue but subtract from xrem."
    foo {x + dx, y + dy}, {nx, ny}, {xrem - 1, 0}, {dx, dy}, n, target, steps
  end

  def next_pos({x, y}, {nx, ny}, {0, yrem}, {dx, dy}, n, target, steps) do
    #IO.inspect "We were going {#{dx}, #{dy}}. Let's continue but subtract from yrem."
    foo {x + dx, y + dy}, {nx, ny}, {0, yrem - 1}, {dx, dy}, n, target, steps
  end

  def co_ordinates(target) do
    {{x, y}, steps} = foo({0, 0}, {0, 0}, {0, 0}, {1, 0}, 1, target, MapSet.new)
  end

  def solve(input, :one) do
    IO.inspect {:solve, input}
    {{x, y}, steps} = co_ordinates(input)


    #print(steps)

    {x, y} |> manhattan_distance_from_origin
  end

  def solve(input, :two) do
    raise "Not implemented"
  end

  def print_pos(steps, x, y) do

    character = case Map.get(steps, {x, y}) do
      nil -> " .. "
      n -> " " <> String.pad_leading(Integer.to_string(n), 2, " ") <> " "
    end

    IO.write(character)
  end
 
  def print_row(steps, y) do
    Enum.each(-2..2, fn(x) -> print_pos(steps, x, y) end)
  end

  def print(steps) do
    Enum.each(-2..2, fn(y) ->
        print_row(steps, y)
        IO.puts ""
      end
    )
  end

end

