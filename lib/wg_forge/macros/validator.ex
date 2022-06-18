defmodule WgForge.Macros.Validator do
  defmacro __using__(_opts) do
    quote do
      def get_difference_set(map, required) do
        MapSet.difference(
          required,
          map
          |> Map.keys()
          |> MapSet.new()
        )
      end

      def valid_size?(size, required_size) when size > 0 and size != required_size,
        do: false

      def valid_size?(size, required_size), do: true
    end
  end
end
