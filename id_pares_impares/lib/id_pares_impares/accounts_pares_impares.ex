defmodule IdParesImpares.AccountsParesImpares do
    import Ecto.Query, warn: false
    alias IdParesImpares.Repo

    alias IdParesImpares.Accounts.User

    def list_users_pares do
        query = from u in User, 
            where: u.id - 2 * (u.id/2) == 0
        Repo.all(query)
    end

    def list_users_impares do
        query = from u in User, 
            where: u.id - 2 * (u.id/2) == 1
        Repo.all(query)
    end
end