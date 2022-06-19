defmodule WgForge.Macros.Router do
  defmacro __using__(_opts) do
    quote do
      use Plug.Router
      use Plug.ErrorHandler

      if Mix.env() == :dev do
        use Plug.Debugger
      end

      @content_type "application/json"

      plug(Plug.Parsers,
        parsers: [:json],
        pass: ["application/json"],
        json_decoder: Jason
      )

      plug(:match)
      plug(:dispatch)

      def render_json(conn, status, data) do
        conn
        |> Map.put(:status, status)
        |> put_resp_content_type(@content_type)
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
