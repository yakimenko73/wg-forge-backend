defmodule WgForge.Router do
  use Plug.Router
  require Logger
  alias WgForge.Postgres.Service

  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:match)

  plug(:dispatch)

  get("/ping", do: send_resp(conn, 200, "Cats Service. Version 0.1.0"))

  get "/cats" do
    render_json(conn, Service.get_cats())
  end

  post "/cats" do
    conn
    |> Map.put(:status, 201)
    |> render_json("Cat created")
  end

  match(_, do: send_resp(conn, 404, "Not found"))

  defp render_json(%{status: status} = conn, data) do
    body = Jason.encode!(data)
    send_resp(conn, status || 200, body)
  end
end
