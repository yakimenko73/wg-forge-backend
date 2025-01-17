defmodule WgForge.Router do
  use WgForge.Macros.Router
  alias WgForge.Plugs.Cat, as: CatsPlug

  get("/ping", do: render_json(conn, "Cats Service. Version 0.1.0"))

  forward("/cats", to: CatsPlug)

  match(_, do: render_json(conn, 404, "Not found"))
end
