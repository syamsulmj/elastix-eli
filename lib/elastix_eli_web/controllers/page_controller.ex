defmodule ElastixEliWeb.PageController do
  use ElastixEliWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
