defmodule Script.CompanyType do
  use Ecto.Schema
  import Ecto.Changeset

@primary_key {:type_id, :integer, []}
  schema "company_type" do
    field :type_description, :string

  end

  @doc false
  def changeset(struct, attrs) do
    struct
  end
end
