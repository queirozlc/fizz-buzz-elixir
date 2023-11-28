defmodule FizzBuzz do
  def build(file_name) do
    result = File.read(file_name)
    handle(result)
  end

  defp handle({:ok, file}), do: handle(file)

  defp handle({:error, reason}) do
    IO.puts("Invalid file: #{reason}")
    []
  end

  defp handle(file) do
    file
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce([], fn x, acc -> [fizz_buzz(x) | acc] end)
  end

  defp fizz_buzz(number) do
    case {rem(number, 3), rem(number, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _ -> number
    end
  end
end
