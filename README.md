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

If you want to generate the modules yourself (based on the protobuf schema)

```bash
MIX_ENV=prod mix protox.generate --multiple-files --output-path=lib/generated protobuf_schemas.proto
```

## Usage

### Encode & Decode sample usage

Sample usage:

```elixir
iex> todo_task = %Assignment.Messages.TodoTask{task_operation: :ADD, currency_pair: "BTC_USDT", from_unix_ts: DateTime.utc_now() |> DateTime.to_unix, until_unix_ts: DateTime.utc_now() |> DateTime.to_unix, task_uuid: "something very unique"}
iex> binary_data = AssignmentMessages.encode_message! todo_task
<< 01, 02, 45, 95, 85, ... >> # binary representation
iex> Assignment.Messages.TodoTask.decode binary_data
{:ok, %Assignment.Messages.TodoTask{ ... }}
iex> Assignment.Messages.TodoTask.decode! binary_data
%Assignment.Messages.TodoTask{ ... }
```

### Decode details

Look at [https://github.com/ahamez/protox#decode](https://github.com/ahamez/protox#decode)