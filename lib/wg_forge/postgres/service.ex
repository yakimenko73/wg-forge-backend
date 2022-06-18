defmodule WgForge.Postgres.Service do
  import Ecto.Query, only: [from: 2]
  alias WgForge.Postgres.Repository, as: Repo
  alias WgForge.Postgres.Scheme.Cat
  alias WgForge.Errors.InvalidFieldError

  def get_cats(%{attribute: attr, order: _} = params) do
    validate_sort_attribute(attr)

    query =
      from(
        cat in Cat,
        order_by: ^order_by(params)
      )

    Repo.all(query)
  end

  def get_cats(_params) do
    Repo.all(Cat)
  end

  defp order_by(%{order: "asc", attribute: field}), do: [asc: String.to_atom(field)]

  defp order_by(%{order: "desc", attribute: field}), do: [desc: String.to_atom(field)]

  defp order_by(_params), do: raise(InvalidFieldError, params: [:order])

  defp validate_sort_attribute(attr) do
    if String.to_atom(attr) not in Cat.get_fields() do
      raise(InvalidFieldError, params: [:attribute])
    end
  end
end
