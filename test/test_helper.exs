ExUnit.start()

Application.ensure_all_started(:plug)

signing_secret = :crypto.strong_rand_bytes(24)
  |> Base.encode64()
  |> String.replace("/", "_")
  |> String.replace("+", "-")

System.put_env("SIGNING_SECRET", signing_secret)