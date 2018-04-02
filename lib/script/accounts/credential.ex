defmodule Script.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  alias Script.Accounts.{Credential, User}

  schema "credentials" do
    field :user_name, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:user_name])
    |> validate_required([:user_name])
    |> unique_constraint(:user_name)
  end
end
