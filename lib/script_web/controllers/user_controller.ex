defmodule ScriptWeb.CMS.UserController do
  use ScriptWeb, :controller

  alias Script.Accounts
  alias Script.Accounts.User

  def index(conn, _params) do
    if conn.assigns.current_user.user_type == 1 do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  else
    redirect(conn, to: "/")
  end
  end

  def new(conn, _params) do
    if conn.assigns.current_user.user_type == 1 do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  else
    redirect(conn, to: "/")
  end
  end

  def create(conn, %{"user" => user_params}) do
    if conn.assigns.current_user.user_type == 1 do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: cms_user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset) 
        render(conn, "new.html", changeset: changeset)
    end
  else
    redirect(conn, to: "/")
  end
  end

  def show(conn, %{"id" => id}) do
    if conn.assigns.current_user.user_type == 1 do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
  else
    redirect(conn, to: "/")
  end
  end

  def edit(conn, %{"id" => id}) do
    if conn.assigns.current_user.user_type == 1 do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  else
    redirect(conn, to: "/")
  end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    if conn.assigns.current_user.user_type == 1 do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: cms_user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  else
    redirect(conn, to: "/")
  end
  end

  def delete(conn, %{"id" => id}) do
    if conn.assigns.current_user.user_type == 1 do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: cms_user_path(conn, :index))
  else
    redirect(conn, to: "/")
  end
  end

end
