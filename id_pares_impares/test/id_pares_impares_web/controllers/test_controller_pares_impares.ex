defmodule IdParesImparesWeb.UserControllerTest do
    use IdParesImparesWeb.ConnCase
  
    alias IdParesImpares.Accounts
    alias IdParesImpares.Accounts.User

    describe "pares" do
        test "lists all user pares", %{conn: conn} do
            conn = get(conn, Routes.pares_impares_path(conn, :id_pares))
            assert json_response(conn, 200)["data"] == []
        end
    end 
    
    describe "impares" do
        test "lists all user impares", %{conn: conn} do
            conn = get(conn, Routes.pares_impares_path(conn, :id_impares))
            assert json_response(conn, 200)["data"] == []
        end
    end
end
