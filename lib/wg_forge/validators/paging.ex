defmodule WgForge.Validators.PagingValidator do
  alias WgForge.Errors.{IncompleteRequestError, InvalidFieldError}
  alias WgForge.Utils.Utils

  @required_params [:limit, :offset]

  def with_require_params!(%{limit: limit, offset: offset}) do
    try do
      [limit, offset] |> Enum.map(&String.to_integer(&1))
    rescue
      ArgumentError -> raise(InvalidFieldError, params: @required_params)
    end
  end

  def with_require_params!(params) do
    if Utils.contains_at_least_one?(@required_params, params),
      do: raise(IncompleteRequestError, params: @required_params)
  end
end
