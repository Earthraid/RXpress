defmodule ScriptWeb.HomeController do
  use ScriptWeb, :controller

  alias Script.Accounts.User
  alias Script.Repo

  def index(conn, _params) do
    user_id = get_session(conn, :user_id)
    user = Repo.get(User, user_id)
    render conn, "index.html"
  end
end
