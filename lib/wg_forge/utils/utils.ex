defmodule WgForge.Utils.Utils do
  def to_atom_keys(map) when is_map(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end

  def contains_at_least_one?(enum, checked), do: Enum.any?(enum, &Map.has_key?(checked, &1))
end
