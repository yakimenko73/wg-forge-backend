defmodule WgForge.Postgres.Scheme.Cat do
  use Ecto.Schema

  @primary_key {:name, :string, []}

  @derive {Jason.Encoder, except: [:__meta__, :__struct__]}
  schema "cats" do
    field(:color, :string)
    field(:tail_length, :integer)
    field(:whiskers_length, :integer)
  end

  def get_fields(), do: __schema__(:fields)
end
