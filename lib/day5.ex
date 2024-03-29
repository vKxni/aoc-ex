defmodule Day5 do
  def task1() do
    input()
    |> Enum.reduce(%{}, &draw_task1/2)
    |> Enum.reduce(0, fn {_, v}, acc -> acc + if v >= 2, do: 1, else: 0 end)
  end

  def task2() do
    input()
    |> Enum.reduce(%{}, &draw_task2/2)
    |> Enum.reduce(0, fn {_, v}, acc -> acc + if v >= 2, do: 1, else: 0 end)
  end

  # private function
  defp draw_vertical(y1, y2, x, acc) do
    y1..y2 |> Enum.reduce(acc, fn y, acc -> Map.update(acc, {x, y}, 1, &(&1 + 1)) end)
  end

  # private function
  defp draw_horizontal(x1, x2, y, acc) do
    x1..x2 |> Enum.reduce(acc, fn x, acc -> Map.update(acc, {x, y}, 1, &(&1 + 1)) end)
  end

  # private function
  defp draw_diagonal(x1, y1, x2, y2, acc) do
    Enum.zip([x1..x2, y1..y2])
    |> Enum.reduce(acc, fn {x, y}, acc -> Map.update(acc, {x, y}, 1, &(&1 + 1)) end)
  end

  # private function
  defp draw_task1(nil, acc), do: acc

  # private function
  defp draw_task1([x1, y1, x2, y2], acc) do
    cond do
      x1 == x2 ->
        draw_vertical(y1, y2, x1, acc)

      y1 == y2 ->
        draw_horizontal(x1, x2, y1, acc)

      true ->
        acc
    end
  end

  # private function
  defp draw_task2(nil, acc), do: acc

  # private function
  defp draw_task2([x1, y1, x2, y2], acc) do
    cond do
      x1 == x2 ->
        draw_vertical(y1, y2, x1, acc)

      y1 == y2 ->
        draw_horizontal(x1, x2, y1, acc)

      abs(x1 - x2) == abs(y1 - y2) ->
        draw_diagonal(x1, y1, x2, y2, acc)

      true ->
        acc
    end
  end

  # define Input, read the file and trim (aassddaa) -> if you want to trim s, use String.trim/2
  # (https://elixirforum.com/t/what-is-the-best-way-to-trim-characters/28300)

  defp input() do
    File.stream!("input/day5.txt")
    |> Stream.map(&String.trim/1)
    |> Stream.map(&parse_coordinates/1)
    |> Enum.to_list()
  end

  # private function
  defp parse_coordinates(line) do
    line
    |> String.replace(" ", "")
    |> String.split(["->", ","])
    |> Enum.map(&String.to_integer/1)
  end
end
