defmodule AOC do
  #        ____          ____          ____          ____ 
  #       /    \        /    \        /    \        /    \
  #      /      \      /      \      /      \      /      \
  #     /  -3,4  \____/ -1,3   \____/  1,2   \____/  3,1   \
  #     \        /    \        /    \        /    \        /
  #      \      /      \      /      \      /      \      /
  #       \____/ -2,3   \____/   0,2  \____/   2,1   \____/
  #       /    \        /    \        /    \        /    \
  #      /      \      /      \      /      \      /      \
  #     /  -3,3  \____/ -1,2   \____/  1,1   \____/   3,0  \
  #     \        /    \        /    \        /    \        /
  #      \      /      \      /      \      /      \      /
  #       \____/ -2,2   \____/   0,1  \____/  2,0   \____/
  #       /    \        /    \        /    \        /    \
  #      /      \      /      \      /      \      /      \
  #     /  -3,2  \____/  -1,1  \____/  1,0   \____/  3,-1  \
  #     \        /    \        /    \        /    \        /
  #      \      /      \      /      \      /      \      /
  #       \____/ -2,1   \____/  0,0   \____/  2,-1  \____/
  #       /    \        /    \        /    \        /    \
  #      /      \      /      \      /      \      /      \
  #     /  -3,1  \____/  -1,0  \____/  1,-1  \____/  3,-2  \
  #     \        /    \        /    \        /    \        /
  #      \      /      \      /      \      /      \      /
  #       \____/  -2,0  \____/  0,-1  \____/  2,-2  \____/
  #       /    \        /    \        /    \        /    \
  #      /      \      /      \      /      \      /      \
  #     /  -3,0  \____/ -1,-1  \____/  1,-2  \____/  3,-3  \
  #     \        /    \        /    \        /    \        /
  #      \      /      \      /      \      /      \      /
  #       \____/ -2,-1  \____/  0,-2  \____/  2,-3  \____/
  #       /    \        /    \        /    \        /    \
  #      /      \      /      \      /      \      /      \
  #     /  -3,-1 \____/ -1,-2  \____/  1,-3  \____/  3,-4  \
  #     \        /    \        /    \        /    \        /
  #      \      /      \      /      \      /      \      /
  #       \____/        \____/        \____/        \____/

  @origin {0, 0}

  @direction_deltas %{
    :n  => { 0,  1},
    :s  => { 0, -1},
    :ne => { 1,  0},
    :se => { 1, -1},
    :nw => {-1,  1},
    :sw => {-1,  0}
  }

  def sign(n) do
    if n < 0, do: -1, else: 1
  end

  def distance_to(a, b) do
    dx = elem(b, 0) - elem(a, 0)
    dy = elem(b, 1) - elem(a, 1)
    if sign(dx) == sign(dy), do: abs(dx + dy), else: max(abs(dx), abs(dy))
  end

  def move(pos, direction) do
    delta = @direction_deltas[direction]
    {elem(pos, 0) + elem(delta, 0), elem(pos, 1) + elem(delta, 1)}
  end

  def directions(input) do
    String.split(String.trim(input), ",", trim: true) |> Enum.map(&String.to_atom/1)
  end

  def solve(input, :one) do
    input
    |> directions
    |> Enum.reduce(@origin, fn(direction, pos) -> move(pos, direction) end)
    |> distance_to(@origin)
  end

  def solve(input, :two) do
    input
    |> directions
    |> Enum.map_reduce(
      @origin,
      fn(direction, pos) ->
        (
          new_pos = move(pos, direction)
          {distance_to(@origin, new_pos), new_pos}
        )
      end
    )
    |> elem(0)
    |> Enum.max
  end
end
