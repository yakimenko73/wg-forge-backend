defmodule WgForge.Validators.SortingValidator do
  use WgForge.Macros.Validator
  alias WgForge.Errors.IncompleteRequestError
  alias WgForge.Utils.Utils

  @required_params MapSet.new([:attribute, :order])

  def with_require_params(params) do
    diff = get_difference_set(params, @required_params)

    unless valid_size?(MapSet.size(diff), MapSet.size(@required_params)) do
      raise(IncompleteRequestError, params: Utils.set_to_enum(diff))
    end
  end
end
