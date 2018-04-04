defmodule ScriptWeb.CMS.PageController do
  use ScriptWeb, :controller

  alias Script.CMS
  alias Script.CMS.Page
  alias Scriupt.Accounts.User
  alias Script.Repo

  def index(conn, _params) do
    pages = CMS.list_pages()
    render(conn, "index.html", pages: pages)
  end

  def new(conn, _params) do
    changeset = CMS.change_page(%Page{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"page" => page_params}) do
    case CMS.create_page(page_params) do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Customer saved successfully.")
        |> redirect(to: cms_page_path(conn, :show, page))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do

    page = CMS.get_page!(id)
    user_id = fetch_session(:user_id)
    user = Repo.get(User, user_id)
    render(conn, "show.html", page: page, user: user)
  end

  def edit(conn, %{"id" => id}) do
    page = CMS.get_page!(id)
    changeset = CMS.change_page(page)
    render(conn, "edit.html", page: page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "page" => page_params}) do
    page = CMS.get_page!(id)

    case CMS.update_page(page, page_params) do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: cms_page_path(conn, :show, page))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", page: page, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    page = CMS.get_page!(id)
    {:ok, _page} = CMS.delete_page(page)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: cms_page_path(conn, :index))
  end
end
