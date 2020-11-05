# AssignmentMessages

## Installation

`mix.exs` dependencies:

```elixir
def deps do
  [
    {:assignment_messages, git: "https://github.com/distributed-applications-2021/assignment-messages", branch: "main"}
  ]
end
```

__If__ you want to generate the modules yourself (based on the protobuf schema). __You don't need to do this! But feel free to try it out.__

```bash
MIX_ENV=prod mix protox.generate --multiple-files --output-path=lib/generated protobuf_schemas.proto
```

## Usage

### Encode & Decode sample usage

Sample usage:

```elixir
iex> todo_task = %AssignmentMessages.TodoTask{task_operation: :ADD, currency_pair: "BTC_USDT", from_unix_ts: DateTime.utc_now() |> DateTime.to_unix, until_unix_ts: DateTime.utc_now() |> DateTime.to_unix, task_uuid: "something very unique"}
iex> binary_data = AssignmentMessages.encode_message! todo_task
<< 01, 02, 45, 95, 85, ... >> # binary representation
iex> AssignmentMessages.TodoTask.decode binary_data
{:ok, %AssignmentMessages.TodoTask{ ... }}
iex> AssignmentMessages.TodoTask.decode! binary_data
%AssignmentMessages.TodoTask{ ... }
```

### Decode details

Look at [https://github.com/ahamez/protox#decode](https://github.com/ahamez/protox#decode)

## Messages made for you

We've defined the following messages:

```elixir
iex> %AssignmentMessages. # press [TAB]
ClonedChunk          ClonedEntry          MixProject
TaskResponse         TodoChunk            TodoTask
encode_message!/1    encode_message/1
# You can see that the following messages are available:
# ClonedChunk, ClonedEntry, TaskResponse, TodoChunk, TodoTask

# You could look at either the protobuf schema or execute the following:
iex> AssignmentMessages.ClonedChunk.defs_by_name()
%{
  chunk_result: {1, {:default, :COMPLETE},
   {:enum, AssignmentMessages.ClonedChunk.Result}},
  entries: {3, :unpacked, {:message, AssignmentMessages.ClonedEntry}},
  original_todo_chunk: {2, {:default, nil},
   {:message, AssignmentMessages.TodoChunk}},
  possible_error_message: {4, {:default, ""}, :string}
}
# while it contains a lot of stuff, you can see that:
# chunk_result needs to be and enum of the AssignmentMessages.ClonedChunk.Result struct.
# entries isn't that intuitive, but it's a list of messages of the AssignmentMessages.ClonedEntry struct.
# original_todo_chunk, which is by default nil, requires a AssignmentMessages.TodoChunk struct
# possible_error_message is just a string
```

I'd suggest looking at the protobuf schema to understand the fields instead of the above output, but that's up to you.

_Note: error messages are only shown when encoding te message. The normal (not bang) version produces more meaningful error messages (most of the time). If that isn't clear, try the bang version. __Read the error mesage!___
