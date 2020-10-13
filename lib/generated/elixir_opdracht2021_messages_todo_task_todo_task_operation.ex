# credo:disable-for-this-file
defmodule(Opdracht2021.Messages.TodoTask.TodoTaskOperation) do
  @moduledoc(false)
  (
    (
      @spec(default() :: :ADD)
      def(default()) do
        :ADD
      end
    )
    @spec(encode(atom) :: integer | atom)
    [def(encode(:ADD)) do
      0
    end, def(encode(:DELETE)) do
      1
    end]
    def(encode(x)) do
      x
    end
    @spec(decode(integer) :: atom | integer)
    [def(decode(0)) do
      :ADD
    end, def(decode(1)) do
      :DELETE
    end]
    def(decode(x)) do
      x
    end
    @spec(constants() :: [{integer, atom}])
    def(constants()) do
      [{0, :ADD}, {1, :DELETE}]
    end
  )
  []
end