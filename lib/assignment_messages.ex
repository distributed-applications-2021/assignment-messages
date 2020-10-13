defmodule AssignmentMessages do
  def encode_message(message) do
    Protox.Encode.encode(message)
    |> case do
      {:ok, iolist} -> {:ok, :binary.list_to_bin(iolist)}
      error -> error
    end
  end

  def encode_message!(message) do
    Protox.Encode.encode!(message) |> :binary.list_to_bin()
  end
end
