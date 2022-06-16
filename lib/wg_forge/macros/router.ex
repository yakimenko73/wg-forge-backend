defmodule WgForge.Macros.Router do
  defmacro __using__(_opts) do
    quote do
      use Plug.Router
      use Plug.ErrorHandler

      if Mix.env() == :dev do
        use Plug.Debugger
      end

      require Logger

      plug(Plug.Logger)

      plug(Plug.Parsers,
        parsers: [:json],
        pass: ["application/json"],
        json_decoder: Jason
      )

      plug(:match)
      plug(:dispatch)

      defp render_json(%{status: status} = conn, data) do
        body = Jason.encode!(data)
        send_resp(conn, status || 200, body)
      end
    end
  end
end
