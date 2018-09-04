defmodule JwtAuthApiWeb.Router do
  use JwtAuthApiWeb, :router

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

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/", JwtAuthApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", JwtAuthApiWeb do
    pipe_through :api

    resources "/users", UserController, only: [:create, :show]

    # post for sign_up

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  def "/api/v1", JwtAuthApiWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", USerController, :show
  end
end
