defmodule Script.CMS.Page do
  use Ecto.Schema
  import Ecto.Changeset


  schema "customer" do
    field :f_name, :string
    field :l_name, :string
    field :pharm_id, :integer
    field :cust_address, :string
    field :prescription_id

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:f_name, :l_name, :pharm_id, :cust_address, :prescription_id])
    |> validate_required([:f_name, :l_name, :pharm_id, :cust_address, :prescription_id])
  end
end
