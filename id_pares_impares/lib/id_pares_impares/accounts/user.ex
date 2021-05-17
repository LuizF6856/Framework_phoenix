defmodule IdParesImpares.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :age, :string
    field :balance, :float
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :email, :balance])
    |> validate_required([:name, :age, :email, :balance])
  end
end
