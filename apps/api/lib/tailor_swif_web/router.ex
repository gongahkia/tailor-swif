defmodule TailorSwifWeb.Router do
  use TailorSwifWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TailorSwifWeb do
    pipe_through :api

    get "/health", HealthController, :index
    resources "/users", UserController, except: [:new, :edit]
    resources "/tailors", TailorController, except: [:new, :edit]
    resources "/reviews", ReviewController, except: [:new, :edit]
    resources "/messages", MessageController, only: [:index, :create, :show]
  end
end