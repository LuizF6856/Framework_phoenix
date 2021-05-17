defmodule IdparesImpares.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :string
      add :email, :string
      add :balance, :float

      timestamps()
    end

  end
end
