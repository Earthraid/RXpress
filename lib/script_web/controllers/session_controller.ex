defmodule ScriptWeb.SessionController do
  use ScriptWeb, :controller

  alias Script.Accounts

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"user_name" => user_name, "password" => password}}) do
    case Accounts.authenticate_by_user_name_password(user_name, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        #renew: true stops session fixation attacks
        |> configure_session(renew: true)
        |> redirect(to: "/")
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Bad user name/password combination")
        |> redirect(to: session_path(conn, :new))
    end
  end
#log-out
  def delete(conn, _) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
end
