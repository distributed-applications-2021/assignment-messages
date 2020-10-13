# Assignment2021Messages

## Installation

`mix.exs` dependencies:

```elixir
def deps do
  [
    {:assignment_messages,
       git: "https://github.com/distributed-applications-2021/assignment-messages", branch: "main"}
  ]
end
```

If you want to generate the modules yourself (based on the protobuf schema)

```bash
MIX_ENV=prod mix protox.generate --multiple-files --output-path=lib/generated protobuf_schemas.proto
```
