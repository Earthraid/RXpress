defmodule Script.Couriers do
  use Ecto.Schema
  import Ecto.Changeset

@primary_key {:courier_id, :integer, []}
  schema "couriers" do
    field :courier_name, :string
    field :courier_address, :string
    field :assoc_pharm, :string

  end

  @doc false
  def changeset(struct, attrs) do
    struct
  end
end
