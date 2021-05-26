defmodule IdParesImparesWeb.UserController do
  use IdParesImparesWeb, :controller

  alias IdParesImpares.Accounts
  alias IdParesImpares.Accounts.User

  action_fallback IdParesImparesWeb.FallbackController

  def index(conn, _params) do
    user = Accounts.list_user()
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def id_pares(conn, _params) do
    user = Accounts.list_users_pares()
    render(conn, "index.json", user: user)
  end

  def id_impares(conn, _params) do
    user = Accounts.list_users_impares()
    render(conn, "index.json", user: user)
  end
end
