defmodule WgForge.Plugs.Cat do
  use WgForge.Macros.Router
  require Logger
  alias WgForge.Postgres.Service, as: Postgres
  alias WgForge.Validators.{SortingValidator, PagingValidator}
  alias WgForge.Utils.Utils

  get "/" do
    params = Utils.to_atom_keys(conn.params)
    SortingValidator.with_require_params(params)
    PagingValidator.with_require_params(params)

    render_json(conn, Postgres.get_cats(params))
  end

  post "/" do
    render_json(conn, 201, Postgres.add_cat(conn.params))
  end

  match(_, do: render_json(conn, 404, "Not found"))

  def handle_errors(conn, %{reason: reason}) when is_map_key(reason, :code) do
    render_json(conn, reason.code, reason)
  end

  def handle_errors(conn, %{reason: reason}) do
    Logger.error(inspect(reason))
    render_json(conn, 500, "Internal server error")
  end
end
