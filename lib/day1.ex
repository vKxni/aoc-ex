defmodule Day1 do
  def task1 do
    File.stream!("input/day1.txt")
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
    |> IO.inspect()
  end

  def task2 do
    File.stream!("input/day1.txt")
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(3, 1, :discard)
    |> Stream.map(&Enum.sum/1)
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
    |> IO.inspect()
  end
end
