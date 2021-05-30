defmodule IdParesImpares.AccountsTest do
    use IdParesImpares.DataCase
  
    alias IdParesImpares.AccountsParesImpares
    alias IdParesImpares.Accounts

    @valid_attrs %{
        age: "some age",
        balance: 120.5, 
        email: "some email",
        name: "some name"
    }

    def user_fixture(attrs \\ %{}) do
        {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()
        user
    end
  
    test "list_users_pares/0 returns all user pares" do
        user = user_fixture()
        assert AccountsParesImpares.list_users_pares == [user]
    end
  
    test "list_users_impares/0 returns all user impares" do
        user = user_fixture()
        assert AccountsParesImpares.list_users_impares == [user]
    end
end  
