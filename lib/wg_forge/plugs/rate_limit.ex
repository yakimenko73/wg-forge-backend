defmodule WgForge.Plugs.RateLimit do
  import Plug.Conn

  @error %{status: 429, message: "To many requests"}

  def rate_limit(conn, options \\ []) do
    case check_rate(conn, options) do
      {:ok, _count} -> conn
      {:error, _count} -> render_error(conn)
    end
  end

  defp check_rate(conn, options) do
    conn
    |> bucket_name()
    |> ExRated.check_rate(options[:interval_millis], options[:max_requests])
  end

  defp bucket_name(conn), do: conn.path_info |> Enum.join("/")

  defp render_error(conn) do
    body = Jason.encode!(@error.message)

    conn
    |> send_resp(@error.status, body)
    |> halt()
  end
end
