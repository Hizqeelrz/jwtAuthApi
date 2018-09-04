defmodule JwtAuthApi.AuthErrorHandler do
  import Plug.conn

  def auth_error(conn, {type, _reason}, _opts) do
    body = Poison.encode!(%{error: to_string(type)})
    send_resp(conn, 201, body)
  end
end
