defmodule DndWeb.Router do
  use DndWeb, :router

  # here is a comment

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DndWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DndWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DndWeb.Telemetry
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", DndWeb do
  #   pipe_through :api
  # end
end
