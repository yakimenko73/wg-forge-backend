defmodule WgForge.Postgres.Service do
  import Ecto.Query, only: [from: 2]
  alias WgForge.Postgres.Repository, as: Repo
  alias WgForge.Postgres.Models.Cat

  def get_cats() do
    query =
      from(
        cat in Cat,
        select: cat
      )

    Repo.all(query)
  end
end
