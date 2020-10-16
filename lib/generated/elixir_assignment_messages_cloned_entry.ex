# credo:disable-for-this-file
defmodule(AssignmentMessages.ClonedEntry) do
  @moduledoc(false)
  (
    defstruct(trade_id: 0, date: 0, type: :SELL, rate: "", amount: "", total: "", __uf__: [])
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
        [] |> encode_trade_id(msg) |> encode_date(msg) |> encode_type(msg) |> encode_rate(msg) |> encode_amount(msg) |> encode_total(msg) |> encode_unknown_fields(msg)
      end
      []
      [defp(encode_trade_id(acc, msg)) do
        field_value = msg.trade_id()
        if(field_value == 0) do
          acc
        else
          [acc, "\b", Protox.Encode.encode_int32(field_value)]
        end
      end, defp(encode_date(acc, msg)) do
        field_value = msg.date()
        if(field_value == 0) do
          acc
        else
          [acc, <<16>>, Protox.Encode.encode_int32(field_value)]
        end
      end, defp(encode_type(acc, msg)) do
        field_value = msg.type()
        if(field_value == :SELL) do
          acc
        else
          [acc, <<24>>, field_value |> AssignmentMessages.ClonedEntry.Type.encode() |> Protox.Encode.encode_enum()]
        end
      end, defp(encode_rate(acc, msg)) do
        field_value = msg.rate()
        if(field_value == "") do
          acc
        else
          [acc, "\"", Protox.Encode.encode_string(field_value)]
        end
      end, defp(encode_amount(acc, msg)) do
        field_value = msg.amount()
        if(field_value == "") do
          acc
        else
          [acc, "*", Protox.Encode.encode_string(field_value)]
        end
      end, defp(encode_total(acc, msg)) do
        field_value = msg.total()
        if(field_value == "") do
          acc
        else
          [acc, "2", Protox.Encode.encode_string(field_value)]
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
          parse_key_value(bytes, struct(AssignmentMessages.ClonedEntry))
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
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:trade_id, value}
              {field, rest}
            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              field = {:date, value}
              {field, rest}
            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_enum(bytes, AssignmentMessages.ClonedEntry.Type)
              field = {:type, value}
              {field, rest}
            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:rate, value}
              {field, rest}
            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:amount, value}
              {field, rest}
            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              <<delimited::binary-size(len), rest::binary>> = bytes
              value = delimited
              field = {:total, value}
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
      %{1 => {:trade_id, {:default, 0}, :int32}, 2 => {:date, {:default, 0}, :int32}, 3 => {:type, {:default, :SELL}, {:enum, AssignmentMessages.ClonedEntry.Type}}, 4 => {:rate, {:default, ""}, :string}, 5 => {:amount, {:default, ""}, :string}, 6 => {:total, {:default, ""}, :string}}
    end
    @spec(defs_by_name() :: %{required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}})
    def(defs_by_name()) do
      %{amount: {5, {:default, ""}, :string}, date: {2, {:default, 0}, :int32}, rate: {4, {:default, ""}, :string}, total: {6, {:default, ""}, :string}, trade_id: {1, {:default, 0}, :int32}, type: {3, {:default, :SELL}, {:enum, AssignmentMessages.ClonedEntry.Type}}}
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
    [@spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}), [def(default(:trade_id)) do
      {:ok, 0}
    end, def(default(:date)) do
      {:ok, 0}
    end, def(default(:type)) do
      {:ok, :SELL}
    end, def(default(:rate)) do
      {:ok, ""}
    end, def(default(:amount)) do
      {:ok, ""}
    end, def(default(:total)) do
      {:ok, ""}
    end], def(default(_)) do
      {:error, :no_such_field}
    end]
  )
  []
end