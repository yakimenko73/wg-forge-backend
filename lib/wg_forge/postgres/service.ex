defmodule WgForge.Postgres.Service do
  import Ecto.Query, only: [from: 2]
  alias WgForge.Postgres.Repository, as: Repo
  alias WgForge.Postgres.Models.Cat

  def get_cats(%{attribute: attr, order: order}) do
    query =
      from(
        cat in Cat,
        order_by: ^order_by(order, String.to_atom(attr))
      )

    Repo.all(query)
  end

  def get_cats(_params) do
    Repo.all(Cat)
  end

  defp order_by(_order = "asc", field), do: [asc: field]

  defp order_by(_order = "desc", field), do: [desc: field]
end
