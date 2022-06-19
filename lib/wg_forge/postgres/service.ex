defmodule WgForge.Postgres.Service do
  import Ecto.Query, only: [order_by: 2, limit: 2, offset: 2]
  alias WgForge.Postgres.Repository, as: Repo
  alias WgForge.Postgres.Scheme.Cat
  alias WgForge.Errors.{InvalidFieldError, AlreadyExistError}

  def get_cats(%{attribute: attr, order: _} = params) do
    validate_attribute(attr)

    Cat
    |> with_order(params)
    |> with_paging(params)
    |> Repo.all()
  end

  def get_cats(params) do
    Cat
    |> with_paging(params)
    |> Repo.all()
  end

  def add_cat(params) do
    with %Ecto.Changeset{valid?: valid} = changeset when valid <- Cat.changeset(%Cat{}, params),
         {:ok, _} <- Repo.insert(changeset) do
      changeset.changes
    else
      %Ecto.Changeset{errors: errors} -> raise(InvalidFieldError, params: Keyword.keys(errors))
      {:error, res} -> raise(AlreadyExistError, message: res.errors)
    end
  end

  defp with_order(query, %{order: "asc", attribute: field}),
    do: query |> order_by(asc: ^String.to_atom(field))

  defp with_order(query, %{order: "desc", attribute: field}),
    do: query |> order_by(desc: ^String.to_atom(field))

  defp with_order(_query, _params), do: raise(InvalidFieldError, params: [:order])

  defp with_paging(query, %{limit: limit, offset: offset}),
    do: query |> limit(^limit) |> offset(^offset)

  defp with_paging(query, _params), do: query

  defp validate_attribute(attr) do
    unless String.to_atom(attr) in Cat.get_fields() do
      raise(InvalidFieldError, params: [:attribute])
    end
  end
end
