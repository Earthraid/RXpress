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

    get "/Register", RegisterController, :index

    get "/Login", LoginController, :index


  end
  # Other scopes may use custom stacks.
  # scope "/api", ScriptWeb do
  #   pipe_through :api
  # end
end
