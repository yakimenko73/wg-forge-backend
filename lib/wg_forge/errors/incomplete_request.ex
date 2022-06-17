defmodule WgForge.Errors.IncompleteRequestError do
  @derive {Jason.Encoder, except: [:__exception__]}
  defexception message: "One or more required parameters are missing or incorrect", code: 400
end
