defmodule Segunda_ApiWeb.UserView do 
    use Segunda_ApiWeb, :view

    def render("user.json", %{user: user}), do: user
end