defmodule Day2 do
  def task1 do
    instructions =
      File.stream!("input/day2.txt")
      |> Stream.map(&String.trim/1)
      |> Stream.map(fn str -> String.split(str, " ") end)
      |> Enum.group_by(fn x -> hd(x) end, fn x -> tl(x) end)

    down =
      instructions
      |> Map.get("down")
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()

    up =
      instructions
      |> Map.get("up")
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()

    forward =
      instructions
      |> Map.get("forward")
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()

    position = (down - up) * forward
  end

  def task2 do
    File.stream!("input/day2.txt")
    |> Stream.map(&String.trim/1)
  |> Stream.map(fn str -> String.split(str, " ") end)
  |> Stream.map(fn [cmd, x] -> [cmd, String.to_integer(x)] end)
  |> Enum.reduce({0, 0, 0}, fn instruction, { depth, aim, horizontal_pos } ->
    case instruction do
      ["forward", x] ->
        {aim * x + depth, aim, horizontal_pos + x}

      ["up", x] ->
        {depth, aim - x, horizontal_pos}

      ["down", x] ->
        {depth, aim + x, horizontal_pos}
    end
  end)
  |> then(fn {depth, _aim, hor_pos} -> depth * hor_pos end)
  end
end
