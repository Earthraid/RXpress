defmodule ScriptWeb.CMS.PageView do
  use ScriptWeb, :view

alias Script.Repo
alias Script.Couriers

  def courier_select_options do
    courier_ids = Repo.all(Couriers)
    Enum.map(courier_ids, &{&1.courier_name, &1.courier_id})
  end
end
