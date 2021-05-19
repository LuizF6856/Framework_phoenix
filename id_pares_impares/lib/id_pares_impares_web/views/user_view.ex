defmodule IdParesImparesWeb.UserView do
  use IdParesImparesWeb, :view
  alias IdParesImparesWeb.UserView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
    name: user.name,
    age: user.age,
    balance: user.balance,
    email: user.email}
  end
end
