defmodule WgForge.Plugs.Cat do
  use WgForge.Macros.Router
  alias WgForge.Postgres.Service

  get("/cats", do: render_json(conn, Service.get_cats()))

  post "/cats" do
    conn
    |> Map.put(:status, 201)
    |> render_json("Cat created")
  end
end
