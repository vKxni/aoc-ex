defmodule Day3 do
  def task1 do
    File.stream!("input/day3.txt")
    |> Enum.map(fn line -> String.split(line, "", trim: true) end)
    |> Enum.zip_with(&Enum.frequencies/1)
    |> Enum.map(fn counts -> if counts["0"] > counts["1"], do: ["0", "1"], else: ["1", "0"] end)
    |> Enum.zip_with(&Enum.join/1)
    |> Enum.reduce(1, fn number, product -> String.to_integer(number, 2) * product end)
  end
end
