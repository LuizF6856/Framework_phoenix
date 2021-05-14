defmodule FirstCrud.Repo do
  use Ecto.Repo,
    otp_app: :first_crud,
    adapter: Ecto.Adapters.Postgres
end
