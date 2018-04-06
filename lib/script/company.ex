defmodule Script.Company do
  use Ecto.Schema
  import Ecto.Changeset

@primary_key {:company_id, :integer, []}
  schema "company" do
    field :name, :string
    field :address, :string
    field :company_type, :integer
    field :affiliated_pharmacies, :string

  end

  @doc false
  def changeset(struct, attrs) do
    struct
  end
end
