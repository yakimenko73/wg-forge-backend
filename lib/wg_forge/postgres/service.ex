defmodule WgForge.Postgres.Service do
  import Ecto.Query, only: [from: 2]
  alias WgForge.Postgres.Repository, as: Repo
  alias WgForge.Postgres.Models.Cat

  def get_cats() do
    query =
      from(
        c in Cat,
        select: c.name
      )

    Repo.all(query)
  end
end
