# credo:disable-for-this-file
defmodule(AssignmentMessages.TaskResponse.Result) do
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
    end, def(encode(:TASK_CONFLICT)) do
      1
    end, def(encode(:CANCELLED)) do
      2
    end]
    def(encode(x)) do
      x
    end
    @spec(decode(integer) :: atom | integer)
    [def(decode(0)) do
      :COMPLETE
    end, def(decode(1)) do
      :TASK_CONFLICT
    end, def(decode(2)) do
      :CANCELLED
    end]
    def(decode(x)) do
      x
    end
    @spec(constants() :: [{integer, atom}])
    def(constants()) do
      [{0, :COMPLETE}, {1, :TASK_CONFLICT}, {2, :CANCELLED}]
    end
  )
  []
end