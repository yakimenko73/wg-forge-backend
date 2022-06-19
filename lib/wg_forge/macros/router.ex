defmodule WgForge.Macros.Router do
  defmacro __using__(_opts) do
    quote do
      use Plug.Router
      use Plug.ErrorHandler
      import WgForge.Plugs.RateLimit

      if Mix.env() == :dev do
        use Plug.Debugger
      end

      plug(Plug.Parsers,
        parsers: [:json],
        pass: ["application/json"],
        json_decoder: Jason
      )

      plug(:rate_limit,
        max_requests: Application.get_env(:wg_forge, :max_requests, 600),
        interval_millis: Application.get_env(:wg_forge, :interval_millis, 60_000)
      )

      plug(:match)
      plug(:dispatch)

      @content_type "application/json"

      def render_json(conn, status, data) do
        conn
        |> Map.put(:status, status)
        |> render_json(data)
      end

      def render_json(%{status: status} = conn, data) do
        body = Jason.encode!(data)

        conn
        |> put_resp_content_type(@content_type)
        |> send_resp(status || 200, body)
      end
    end
  end
end
