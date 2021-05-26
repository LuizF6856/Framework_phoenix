defmodule IdParesImpares.Repo do
  use Ecto.Repo,
    otp_app: :id_pares_impares,
    adapter: Ecto.Adapters.Postgres
end
