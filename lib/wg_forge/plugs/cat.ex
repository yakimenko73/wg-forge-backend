defmodule WgForge.Plugs.Cat do
  use WgForge.Macros.Router
  require Logger
  alias WgForge.Postgres.Service, as: Postgres
  alias WgForge.Validators.Sorting, as: SortingValidator
  alias WgForge.Errors.IncompleteRequestError
  alias WgForge.Utils.Utils

  get "/" do
    params = Utils.to_atom_keys(conn.params)
    SortingValidator.with_require_params(params)

    render_json(conn, Postgres.get_cats(params))
  end

  post "/" do
    render_json(conn, 201, "Cat created")
  end

  match(_, do: render_json(conn, 404, "Not found"))

  def handle_errors(conn, %{reason: reason}) when is_map_key(reason, :code) do
    render_json(conn, reason.code, reason)
  end

  def handle_errors(conn, %{reason: reason}) do
    render_json(conn, 500, reason)
  end
end
