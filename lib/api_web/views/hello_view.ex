defmodule ApiWeb.HelloView do
    use ApiWeb, :view

    def render("hello.json", %{messenger: messenger}) do
        "Hello #{messenger}"
    end
end