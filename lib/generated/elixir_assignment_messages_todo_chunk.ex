# credo:disable-for-this-file
defmodule(AssignmentMessages.TodoChunk) do
  @moduledoc(false)
  (
    defstruct(currency_pair: "", from_unix_ts: 0, until_unix_ts: 0, task_dbid: 0, __uf__: [])
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
        [] |> encode_currency_pair(msg) |> encode_from_unix_ts(msg) |> encode_until_unix_ts(msg) |> encode_task_dbid(msg) |> encode_unknown_fields(msg)
      end
      []
      [defp(encode_currency_pair(acc, msg)) do
        field_value = msg.currency_pair()
        if(field_value == "") do
          acc
        else
          [acc, "\n", Protox.Encode.encode_string(field_value)]
        end
      end, defp(encode_from_unix_ts(acc, msg)) do
        field_value = msg.from_unix_ts()
        if(field_value == 0) do
          acc
        else
          [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
        end
      end, defp(encode_until_unix_ts(acc, msg)) do
        field_value = msg.until_unix_ts()
        if(field_value == 0) do
          acc
        else
          [acc, <<24>>, Protox.Encode.encode_int32(field_value)]
        end
      end, defp(encode_task_dbid(acc, msg)) do
        field_value = msg.task_dbid()
        if(field_value == 0) do
          acc
        else
          [acc, " ", Protox.Encode.encode_int32(field_value)]
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
          parse_key_value(bytes, struct(AssignmentMessages.TodoChunk))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:currency_pair, value}
              {field, rest}
            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:from_unix_ts, value}
              {field, rest}
            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:until_unix_ts, value}
              {field, rest}
            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:task_dbid, value}
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
      %{1 => {:currency_pair, {:default, ""}, :string}, 2 => {:from_unix_ts, {:default, 0}, :int32}, 3 => {:until_unix_ts, {:default, 0}, :int32}, 4 => {:task_dbid, {:default, 0}, :int32}}
    end
    @spec(defs_by_name() :: %{required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}})
    def(defs_by_name()) do
      %{currency_pair: {1, {:default, ""}, :string}, from_unix_ts: {2, {:default, 0}, :int32}, task_dbid: {4, {:default, 0}, :int32}, until_unix_ts: {3, {:default, 0}, :int32}}
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
    [@spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}), [def(default(:currency_pair)) do
      {:ok, ""}
    end, def(default(:from_unix_ts)) do
      {:ok, 0}
    end, def(default(:until_unix_ts)) do
      {:ok, 0}
    end, def(default(:task_dbid)) do
      {:ok, 0}
    end], def(default(_)) do
      {:error, :no_such_field}
    end]
  )
  []
end