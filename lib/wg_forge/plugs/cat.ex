defmodule WgForge.Plugs.Cat do
  use WgForge.Macros.Router
  alias WgForge.Postgres.Service

  get("/", do: render_json(conn, Service.get_cats()))

  post "/" do
    conn
    |> Map.put(:status, 201)
    |> render_json("Cat created")
  end

  match(_, do: render_not_found_error(conn))
end
