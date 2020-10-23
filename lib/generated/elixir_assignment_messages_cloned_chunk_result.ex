# credo:disable-for-this-file
defmodule(AssignmentMessages.ClonedChunk.Result) do
  @moduledoc(false)
  (
    (
      @spec(default() :: :COMPLETE)
      def(default()) do
        :COMPLETE
      end
    )
    @spec(encode(atom) :: integer | atom)
    [def(encode(:COMPLETE)) do
      0
    end, def(encode(:WINDOW_TOO_BIG)) do
      1
    end, def(encode(:RANDOM_ERROR)) do
      2
    end]
    def(encode(x)) do
      x
    end
    @spec(decode(integer) :: atom | integer)
    [def(decode(0)) do
      :COMPLETE
    end, def(decode(1)) do
      :WINDOW_TOO_BIG
    end, def(decode(2)) do
      :RANDOM_ERROR
    end]
    def(decode(x)) do
      x
    end
    @spec(constants() :: [{integer, atom}])
    def(constants()) do
      [{0, :COMPLETE}, {1, :WINDOW_TOO_BIG}, {2, :RANDOM_ERROR}]
    end
  )
  []
end