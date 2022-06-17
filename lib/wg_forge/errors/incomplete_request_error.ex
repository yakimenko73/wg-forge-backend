defmodule WgForge.Errors.IncompleteRequestError do
  defexception message: "One or more required parameters are missing"
end
