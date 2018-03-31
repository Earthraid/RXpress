defmodule ScriptWeb.HomeController do
  use ScriptWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
