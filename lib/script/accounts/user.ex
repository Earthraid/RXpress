defmodule Script.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Script.Accounts.{User, Credential}

  schema "users" do
    field :user_name, :string
    field :password, :string
    field :company_id, :integer
    field :user_type, :integer
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_name, :password, :company_id, :user_type])
    |> validate_required([:user_name, :password, :company_id, :user_type])
    |> unique_constraint(:user_name)
  end
end
