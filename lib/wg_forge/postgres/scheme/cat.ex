defmodule WgForge.Postgres.Scheme.Cat do
  use Ecto.Schema
  import Ecto.Changeset

  @cat_colors ["black", "white", "black & white", "red", "red & white", "red & black & white"]
  @required_fields [:name, :color, :tail_length, :whiskers_length]

  @derive {Jason.Encoder, except: [:__meta__, :__struct__]}
  @primary_key false
  schema "cats" do
    field(:name, :string, primary_key: true)
    field(:color, :string)
    field(:tail_length, :integer)
    field(:whiskers_length, :integer)
  end

  def get_fields(), do: __schema__(:fields)

  def changeset(cat, params \\ %{}) do
    cat
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:color, @cat_colors)
    |> unique_constraint(:name, name: :cats_pkey, message: "Cat name already exists")
  end
end
