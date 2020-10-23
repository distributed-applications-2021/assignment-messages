# credo:disable-for-this-file
defmodule(AssignmentMessages.ClonedChunk) do
  @moduledoc(false)
  (
    defstruct(chunk_result: :COMPLETE, original_todo_chunk: nil, entries: [], possible_error_message: "", __uf__: [])
    (
      @spec(encode(struct) :: {:ok, iodata} | {:error, any})
      def(encode(msg)) do
        try do
          {:ok, encode!(msg)}
        rescue
          e ->
            {:error, e}
        end
      end
      @spec(encode!(struct) :: iodata | no_return)
      def(encode!(msg)) do
        [] |> encode_chunk_result(msg) |> encode_original_todo_chunk(msg) |> encode_entries(msg) |> encode_possible_error_message(msg) |> encode_unknown_fields(msg)
      end
      []
      [defp(encode_chunk_result(acc, msg)) do
        field_value = msg.chunk_result()
        if(field_value == :COMPLETE) do
          acc
        else
          [acc, "\b", field_value |> AssignmentMessages.ClonedChunk.Result.encode() |> Protox.Encode.encode_enum()]
        end
      end, defp(encode_original_todo_chunk(acc, msg)) do
        field_value = msg.original_todo_chunk()
        if(field_value == nil) do
          acc
        else
          [acc, <<18>>, Protox.Encode.encode_message(field_value)]
        end
      end, defp(encode_entries(acc, msg)) do
        case(msg.entries()) do
          [] ->
            acc
          values ->
            [acc, Enum.reduce(values, [], fn value, acc -> [acc, <<26>>, Protox.Encode.encode_message(value)] end)]
        end
      end, defp(encode_possible_error_message(acc, msg)) do
        field_value = msg.possible_error_message()
        if(field_value == "") do
          acc
        else
          [acc, "\"", Protox.Encode.encode_string(field_value)]
        end
      end]
      defp(encode_unknown_fields(acc, msg)) do
        Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc -> case(wire_type) do
          0 ->
            [acc, Protox.Encode.make_key_bytes(tag, :int32), bytes]
          1 ->
            [acc, Protox.Encode.make_key_bytes(tag, :double), bytes]
          2 ->
            len_bytes = bytes |> byte_size() |> Protox.Varint.encode()
            [acc, Protox.Encode.make_key_bytes(tag, :packed), len_bytes, bytes]
          5 ->
            [acc, Protox.Encode.make_key_bytes(tag, :float), bytes]
        end end)
      end
    )
    (
      @spec(decode(binary) :: {:ok, struct} | {:error, any})
      def(decode(bytes)) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e ->
            {:error, e}
        end
      end
      (
        @spec(decode!(binary) :: struct | no_return)
        def(decode!(bytes)) do
          parse_key_value(bytes, struct(AssignmentMessages.ClonedChunk))
        end
      )
      (
        @spec(parse_key_value(binary, struct) :: struct)
        defp(parse_key_value(<<>>, msg)) do
          msg
        end
        defp(parse_key_value(bytes, msg)) do
          {field, rest} = case(Protox.Decode.parse_key(bytes)) do
            {0, _, _} ->
              raise(%Protox.IllegalTagError{})
            {1, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, AssignmentMessages.ClonedChunk.Result)
              field = {:chunk_result, value}
              {field, rest}
            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = AssignmentMessages.TodoChunk.decode!(delimited)
              field = {:original_todo_chunk, Protox.Message.merge(msg.original_todo_chunk(), value)}
              {field, rest}
            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = AssignmentMessages.ClonedEntry.decode!(delimited)
              field = {:entries, msg.entries() ++ List.wrap(value)}
              {field, rest}
            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:possible_error_message, value}
              {field, rest}
            {tag, wire_type, rest} ->
              {value, new_rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              field = {msg.__struct__.unknown_fields_name, [value | msg.__struct__.unknown_fields(msg)]}
              {field, new_rest}
          end
          msg_updated = struct(msg, [field])
          parse_key_value(rest, msg_updated)
        end
      )
      []
    )
    @spec(defs() :: %{required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}})
    def(defs()) do
      %{1 => {:chunk_result, {:default, :COMPLETE}, {:enum, AssignmentMessages.ClonedChunk.Result}}, 2 => {:original_todo_chunk, {:default, nil}, {:message, AssignmentMessages.TodoChunk}}, 3 => {:entries, :unpacked, {:message, AssignmentMessages.ClonedEntry}}, 4 => {:possible_error_message, {:default, ""}, :string}}
    end
    @spec(defs_by_name() :: %{required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}})
    def(defs_by_name()) do
      %{chunk_result: {1, {:default, :COMPLETE}, {:enum, AssignmentMessages.ClonedChunk.Result}}, entries: {3, :unpacked, {:message, AssignmentMessages.ClonedEntry}}, original_todo_chunk: {2, {:default, nil}, {:message, AssignmentMessages.TodoChunk}}, possible_error_message: {4, {:default, ""}, :string}}
    end
    @spec(required_fields() :: [])
    def(required_fields()) do
      []
    end
    @spec(unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}])
    def(unknown_fields(msg)) do
      msg.__uf__()
    end
    @spec(unknown_fields_name() :: :__uf__)
    def(unknown_fields_name()) do
      :__uf__
    end
    @spec(clear_unknown_fields(struct) :: struct)
    def(clear_unknown_fields(msg)) do
      struct!(msg, [{unknown_fields_name(), []}])
    end
    @spec(syntax() :: atom)
    def(syntax()) do
      :proto3
    end
    [@spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}), [def(default(:chunk_result)) do
      {:ok, :COMPLETE}
    end, def(default(:original_todo_chunk)) do
      {:ok, nil}
    end, def(default(:entries)) do
      {:error, :no_default_value}
    end, def(default(:possible_error_message)) do
      {:ok, ""}
    end], def(default(_)) do
      {:error, :no_such_field}
    end]
  )
  []
end