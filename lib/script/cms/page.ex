defmodule Script.CMS.Page do
  use Ecto.Schema
  import Ecto.Changeset


  schema "customer" do
    field :f_name, :string
    field :l_name, :string
    field :pharm_id, :integer
    field :cust_address, :string
    field :med_name, :string
    field :med_info, :string
    field :pickup_time, :time
    field :delivery_time, :time
    field :delivered, :boolean
    field :not_delivered, :boolean
    field :courier_id, :integer

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:f_name, :l_name, :pharm_id, :cust_address, :med_name, :med_info, :pickup_time,
    :delivery_time, :delivered, :not_delivered, :courier_id])
    |> validate_required([:f_name, :l_name, :pharm_id, :cust_address, :med_name, :pickup_time,
    :delivery_time])
  end
end
