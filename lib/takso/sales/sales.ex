defmodule Takso.Sales do
  import Ecto.Query, warn: false
  alias Takso.Repo
  alias Takso.Sales.Booking

  # Fetch a booking by its ID or another identifier
  def get_booking!(id) do
    Repo.get!(Booking, id)
  end


end
