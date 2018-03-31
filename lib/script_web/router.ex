defmodule ScriptWeb.Router do
  use ScriptWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScriptWeb do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index

    resources "/Users", UserController
    resources "/Sessions", SessionController, only: [:new, :create, :delete], singleton: true

  end
  #contains page information such as author, if no login, redirects to home with flash error
  scope "/CMS", ScriptWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/Pages", PageController
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Script.Accounts.get_user!(user_id))
    end
  end
  # Other scopes may use custom stacks.
  # scope "/api", ScriptWeb do
  #   pipe_through :api
  # end
end
