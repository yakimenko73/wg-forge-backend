defmodule WgForge.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:match)

  plug(:dispatch)

  match("/ping", do: send_resp(conn, 200, "Cats Service. Version 0.1.0"))

  match(_, do: send_resp(conn, 404, "Not found"))
end
