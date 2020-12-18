AuthPlug
========

## Usage

1. Add this plug to your `mix.exs` dependencies:

```elixir
def deps do
  # ...
  {:auth_plug, "~> 0.0"},
  #...
end
```

2. add environment variable

```
# .env
SIGNING_SECRET=secret
```