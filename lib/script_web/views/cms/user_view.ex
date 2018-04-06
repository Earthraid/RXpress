defmodule ScriptWeb.CMS.UserView do
  use ScriptWeb, :view


  alias Script.CompanyType
  alias Script.Repo
  alias Script.Company

  def company_select_options do
    company_types = Repo.all(CompanyType)
    Enum.map(company_types, &{&1.type_description, &1.type_id})
  end

  def company_options do
    companies = Repo.all(Company)
    Enum.map(companies, &{&1.name, &1.company_id})
  end

end
