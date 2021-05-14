defmodule Segunda_ApiWeb.UserController do 
    use Segunda_ApiWeb, :controller

    def signup(conn, %{"user" => user}) do
        conn
        |> put_status(:created)
        |> render("user.json", %{user: user})
    end
end