defmodule FirstCrudWeb.UserView do
  use FirstCrudWeb, :view

  def render("user.html", %{user: user}), do: user
end
