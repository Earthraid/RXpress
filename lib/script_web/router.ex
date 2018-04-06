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



    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
  #copy and paste ^ into /pharmacy

  end
  #Model as to how I think I need to move forward with login credentials and page access
  scope "/", ScriptWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/users", UserController

    resources "/customers", PageController
  end


  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/Sessions/new")
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
