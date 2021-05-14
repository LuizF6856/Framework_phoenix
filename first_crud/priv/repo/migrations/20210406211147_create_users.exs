defmodule FirstCrud.Repo.Migrations.CreateUsers do
  use Ecto.Migration
  use Ecto.Schema
  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      timestamps()
    end   
  end
end
