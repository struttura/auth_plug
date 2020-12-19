defmodule AuthPlug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :auth_plug,
      version: "0.1.0",
      elixir: "~> 1.10",
      deps: deps(),
      package: package(),
      description: "Auth plug to be used with struttura/auth",
      source_url: "https://github.com/struttura/auth_plug",
      test_paths: ["./test"],
      docs: [
        extras: ~W(README.md CHANGELOG.md)
      ]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:plug, "~> 1.11"},
      {:secret, "~> 0.2.0"}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE CHANGELOG.md),
      maintainers: ["Brandon Bassett"],
      licenses: ["Apache 2.0"],
      links: %{
        "Github" => "http://github.com/struttura/auth_plug"
      }
    ]
  end
end
