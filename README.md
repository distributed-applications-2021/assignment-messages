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
