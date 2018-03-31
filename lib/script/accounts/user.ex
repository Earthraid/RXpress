defmodule Script.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Script.Accounts.{User, Credential}

  schema "users" do
    field :email, :string
    field :password, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
  end
end
