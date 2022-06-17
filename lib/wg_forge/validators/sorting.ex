defmodule WgForge.Validators.Sorting do
  alias WgForge.Errors.IncompleteRequestError

  @required_params [:attribute, :order]
  @valid_orders ["asc", "desc"]

  def with_require_params(%{attribute: _, order: order}) do
    order |> validate_order()
  end

  def with_require_params(params) do
    if Enum.any?(@required_params, &Map.has_key?(params, &1)), do: raise(IncompleteRequestError)
  end

  defp validate_order(order) do
    unless Enum.member?(@valid_orders, order), do: raise(IncompleteRequestError)
  end
end
