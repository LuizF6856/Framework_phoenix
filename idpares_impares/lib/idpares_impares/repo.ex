defmodule IdparesImpares.Repo do
  use Ecto.Repo,
    otp_app: :idpares_impares,
    adapter: Ecto.Adapters.Postgres
end
