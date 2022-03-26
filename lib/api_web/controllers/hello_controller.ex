defmodule ApiWeb.HelloController do
    use ApiWeb, :controller

    def hello(conn, _params) do

        conn
        |> put_status(:ok)
        |> json({:ok, "Hello world"}) #Using an atom as the template name also works :hello
    end
end