defmodule Segunda_ApiWeb.Router do
  use Segunda_ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Segunda_ApiWeb do
    pipe_through :api

    post "/auth/signup", UserController, :signup#signup é uma função que está na userController
  end
end
