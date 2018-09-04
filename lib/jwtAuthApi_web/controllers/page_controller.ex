defmodule JwtAuthApiWeb.PageController do
  use JwtAuthApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
