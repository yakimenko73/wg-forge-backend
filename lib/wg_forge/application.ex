defmodule WgForge.Application do
  use Application
  require Logger
  alias WgForge.Postgres.Repository, as: PostgresRepo

  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: WgForge.Router,
        options: [
          ip: ip(),
          port: port()
        ]
      },
      PostgresRepo
    ]

    opts = [strategy: :one_for_one, name: WgForge.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end

  defp port, do: Application.get_env(:wg_forge, :port, 8080)

  defp ip, do: Application.get_env(:wg_forge, :ip, {127, 0, 0, 1})
end
