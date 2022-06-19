defmodule WgForge.Errors.AlreadyExistError do
  @derive {Jason.Encoder, except: [:__exception__]}
  defexception message: "Resource already exist", code: 400
end
