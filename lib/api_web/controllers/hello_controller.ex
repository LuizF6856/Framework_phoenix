defmodule ApiWeb.HelloController do
    use ApiWeb, :controller

    def hello(conn, _params) do

        conn
        |> put_status(:ok)
        |> text("Hello world")
    end

    def hello_wih_params(conn, %{"messenger" => messenger}) do

        conn 
        |> put_status(:ok)
        |> render("hello.json", messenger: messenger)
    end
end