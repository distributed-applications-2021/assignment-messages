# credo:disable-for-this-file
defmodule(Opdracht2021.Messages.TodoTask) do
  @moduledoc(false)
  (
    defstruct(task_operation: :ADD, task_uuid: "", currency_pair: "", from_unix_ts: 0, until_unix_ts: 0, __uf__: [])
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
        [] |> encode_task_operation(msg) |> encode_task_uuid(msg) |> encode_currency_pair(msg) |> encode_from_unix_ts(msg) |> encode_until_unix_ts(msg) |> encode_unknown_fields(msg)
      end
      []
      [defp(encode_task_operation(acc, msg)) do
        field_value = msg.task_operation()
        if(field_value == :ADD) do
          acc
        else
          [acc, "\b", field_value |> Opdracht2021.Messages.TodoTask.TodoTaskOperation.encode() |> Protox.Encode.encode_enum()]
        end
      end, defp(encode_task_uuid(acc, msg)) do
        field_value = msg.task_uuid()
        if(field_value == "") do
          acc
        else
          [acc, <<18>>, Protox.Encode.encode_string(field_value)]
        end
      end, defp(encode_currency_pair(acc, msg)) do
        field_value = msg.currency_pair()
        if(field_value == "") do
          acc
        else
          [acc, <<26>>, Protox.Encode.encode_string(field_value)]
        end
      end, defp(encode_from_unix_ts(acc, msg)) do
        field_value = msg.from_unix_ts()
        if(field_value == 0) do
          acc
        else
          [acc, " ", Protox.Encode.encode_int32(field_value)]
        end
      end, defp(encode_until_unix_ts(acc, msg)) do
        field_value = msg.until_unix_ts()
        if(field_value == 0) do
          acc
        else
          [acc, "(", Protox.Encode.encode_int32(field_value)]
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
          parse_key_value(bytes, struct(Opdracht2021.Messages.TodoTask))
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
              {value, rest} = Protox.Decode.parse_enum(bytes, Opdracht2021.Messages.TodoTask.TodoTaskOperation)
              field = {:task_operation, value}
              {field, rest}
            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:task_uuid, value}
              {field, rest}
            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:currency_pair, value}
              {field, rest}
            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:from_unix_ts, value}
              {field, rest}
            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:until_unix_ts, value}
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
      %{1 => {:task_operation, {:default, :ADD}, {:enum, Opdracht2021.Messages.TodoTask.TodoTaskOperation}}, 2 => {:task_uuid, {:default, ""}, :string}, 3 => {:currency_pair, {:default, ""}, :string}, 4 => {:from_unix_ts, {:default, 0}, :int32}, 5 => {:until_unix_ts, {:default, 0}, :int32}}
    end
    @spec(defs_by_name() :: %{required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}})
    def(defs_by_name()) do
      %{currency_pair: {3, {:default, ""}, :string}, from_unix_ts: {4, {:default, 0}, :int32}, task_operation: {1, {:default, :ADD}, {:enum, Opdracht2021.Messages.TodoTask.TodoTaskOperation}}, task_uuid: {2, {:default, ""}, :string}, until_unix_ts: {5, {:default, 0}, :int32}}
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
    [@spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}), [def(default(:task_operation)) do
      {:ok, :ADD}
    end, def(default(:task_uuid)) do
      {:ok, ""}
    end, def(default(:currency_pair)) do
      {:ok, ""}
    end, def(default(:from_unix_ts)) do
      {:ok, 0}
    end, def(default(:until_unix_ts)) do
      {:ok, 0}
    end], def(default(_)) do
      {:error, :no_such_field}
    end]
  )
  []
end