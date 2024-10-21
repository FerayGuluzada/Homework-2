defmodule Takso.Sales.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :customer_name, :string
    field :pickup_location, :string
    field :dropoff_location, :string
    field :status, :string
    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:customer_name, :pickup_location, :dropoff_location, :status])
    |> validate_required([:customer_name, :pickup_location, :dropoff_location, :status])
  end
end
