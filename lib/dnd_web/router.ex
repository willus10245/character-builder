defmodule DndWeb.Router do
  use DndWeb, :router
  import Phoenix.LiveDashboard.Router

  # here is a comment

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

  scope "/", DndWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  if Mix.env() == :dev do
    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard"
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", DndWeb do
  #   pipe_through :api
  # end
end
