defmodule WgForge.Plugs.Cat do
  use WgForge.Macros.Router
  require Logger
  alias WgForge.Postgres.Service, as: Postgres
  alias WgForge.Validators.Sorting, as: SortingValidator
  alias WgForge.Errors.IncompleteRequestError

  get "/" do
    SortingValidator.with_require_params(conn.params)

    render_json(conn, Postgres.get_cats())
  end

  post "/" do
    render_json(conn, 201, "Cat created")
  end

  match(_, do: render_json(conn, 404, "Not found"))

  def handle_errors(conn, %{kind: _, reason: reason, stack: _}) when is_exception(reason, IncompleteRequestError) do
    render_json(conn, 400, reason.message)
  end
end
