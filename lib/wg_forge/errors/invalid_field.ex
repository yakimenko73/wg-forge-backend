defmodule WgForge.Errors.InvalidFieldError do
  @derive {Jason.Encoder, except: [:__exception__]}
  defexception message: "One or more parameters are invalid", code: 400, params: []
end
