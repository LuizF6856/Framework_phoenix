defmodule IdParesImparesWeb.ParesImparesController do
    use IdParesImparesWeb, :controller

    alias IdParesImpares.AccountsParesImpares

    action_fallback IdParesImparesWeb.FallbackController


    def id_pares(conn, _params) do
        user = AccountsParesImpares.list_users_pares()
        render(conn, "index.json", user: user)
    end

    def id_impares(conn, _params) do
        user = AccountsParesImpares.list_users_impares()
        render(conn, "index.json", user: user)
    end
end