defmodule WgForge.Postgres.Models.Cat do
  use Ecto.Schema

  schema "cat" do
    field(:name, :string)
    field(:color, :string)
    field(:tail_length, :integer)
    field(:whiskers_length, :integer)
  end
end
