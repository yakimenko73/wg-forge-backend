defmodule WgForge.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http, plug: WgForge.Router, options: [port: 8080]
      }
    ]

    opts = [strategy: :one_for_one, name: WgForge.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
