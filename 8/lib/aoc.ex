defmodule AOC do
  def parse_line(line) do
    Regex.named_captures(
      ~r{(?<target_register>[a-z]+) (?<operator>inc|dec) (?<delta>[-]?\d+) if (?<cond_register>[a-z]+) (?<cond_operator>>=|<=|<|>|==|!=) (?<cond_value>[-]?\d+)},
      line
    )
  end

  def check_condition(cond_register_value, cond_operator, cond_value) do
    apply(Kernel, cond_operator, [cond_register_value, cond_value])
  end

  def execute(statements, registers \\ %{})
  def execute([], registers), do: registers
  def execute([statement|statements], registers) do

    target_register_name = statement["target_register"]
    target_register_value = Map.get(registers, target_register_name, 0)
    cond_register_value = Map.get(registers, statement["cond_register"], 0)

    multiplier = %{"inc" => 1, "dec" => -1}[statement["operator"]]

    delta = String.to_integer(statement["delta"])
    cond_value = String.to_integer(statement["cond_value"])
    cond_operator = String.to_atom(statement["cond_operator"])

    new_value = target_register_value + (delta * multiplier)

    registers = case check_condition(cond_register_value, cond_operator, cond_value) do
      true -> Map.put(registers, target_register_name, new_value)
              |> Map.put(:__max__, max(Map.get(registers, :__max__, 0), new_value))
      false -> registers
    end

    execute(statements, registers)
  end

  def solve(input) do
    registers = execute(input |> String.split("\n", trim: true) |> Enum.map(&parse_line/1))

    max_ever = registers.__max__
    registers = Map.delete(registers, :__max__)

    {registers |> Map.values |> Enum.max, max_ever}
  end
end

