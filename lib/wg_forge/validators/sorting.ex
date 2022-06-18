defmodule WgForge.Validators.Sorting do
  alias WgForge.Errors.IncompleteRequestError

  @required_params MapSet.new([:attribute, :order])

  def with_require_params(params) do
    @required_params
    |> MapSet.difference(
      params
      |> Map.keys()
      |> MapSet.new()
    )
    |> validate_difference()
  end

  defp validate_difference(%MapSet{map: map}) do
    diff_size = map_size(map)

    if diff_size > 0 and MapSet.size(@required_params) != diff_size do
      raise(IncompleteRequestError, params: Map.keys(map))
    end
  end
end
