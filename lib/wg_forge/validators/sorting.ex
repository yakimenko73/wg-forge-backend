defmodule WgForge.Validators.SortingValidator do
  alias WgForge.Errors.IncompleteRequestError
  alias WgForge.Utils.Utils

  @required_params [:attribute, :order]

  def with_require_params!(%{attribute: _, order: _}), do: :ok

  def with_require_params!(params) do
    if Utils.contains_at_least_one?(@required_params, params),
      do: raise(IncompleteRequestError, params: @required_params)
  end
end
