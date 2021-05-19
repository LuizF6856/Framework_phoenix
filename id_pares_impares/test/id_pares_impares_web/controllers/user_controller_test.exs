defmodule IdParesImparesWeb.UserControllerTest do
  use IdParesImparesWeb.ConnCase

  alias IdParesImpares.Accounts
  alias IdParesImpares.Accounts.User

  @create_attrs %{
    age: "some age",
    balance: 120.5,
    email: "some email",
    name: "some name"
  }
  @update_attrs %{
    age: "some updated age",
    balance: 456.7,
    email: "some updated email",
    name: "some updated name"
  }
  @invalid_attrs %{age: nil, balance: nil, email: nil, name: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user without user on db", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      require IEx
      IEx.pry
      assert json_response(conn, 200)["data"] == []
    end
      test "lists all user with one user on db", %{conn: conn} do
        user = fixture(:user)
        conn = get(conn, Routes.user_path(conn, :index))
        require IEx
        IEx.pry
        assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => "some age",
               "balance" => 120.5,
               "email" => "some email",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => "some updated age",
               "balance" => 456.7,
               "email" => "some updated email",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end

  describe "pares" do
    test "lists all user pares", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :id_pares))
      assert json_response(conn, 200)["data"] == []
    end
  end 
end
