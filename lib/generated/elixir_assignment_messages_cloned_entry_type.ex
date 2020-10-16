# credo:disable-for-this-file
defmodule(AssignmentMessages.ClonedEntry.Type) do
  @moduledoc(false)
  (
    (
      @spec(default() :: :SELL)
      def(default()) do
        :SELL
      end
    )
    @spec(encode(atom) :: integer | atom)
    [def(encode(:SELL)) do
      0
    end, def(encode(:BUY)) do
      1
    end]
    def(encode(x)) do
      x
    end
    @spec(decode(integer) :: atom | integer)
    [def(decode(0)) do
      :SELL
    end, def(decode(1)) do
      :BUY
    end]
    def(decode(x)) do
      x
    end
    @spec(constants() :: [{integer, atom}])
    def(constants()) do
      [{0, :SELL}, {1, :BUY}]
    end
  )
  []
end