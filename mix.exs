defmodule WgForge.MixProject do
  use Mix.Project

  def project do
    [
      app: :wg_forge,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto, :postgrex],
      mod: {WgForge.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:ecto, "~> 3.8.4"},
      {:ecto_sql, "~> 3.0-rc.1"},
      {:postgrex, "~> 0.16.3"}
    ]
  end
end
