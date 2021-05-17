defmodule IdParesImpares.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :age, :string
      add :email, :string
      add :balance, :float

      timestamps()
    end

  end
end
