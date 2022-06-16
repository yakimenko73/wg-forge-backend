defmodule WgForge.Postgres.Repository do
  use Ecto.Repo,
    otp_app: :wg_forge,
    adapter: Ecto.Adapters.Postgres
end
