defmodule WgForge.Utils.Utils do
  def to_atom_keys(map) when is_map(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end
end
