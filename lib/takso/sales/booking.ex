defmodule Takso.Sales.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :pickup_address, :string
    field :dropoff_address, :string
    field :customer_name, :string
    field :status, :string

    timestamps()
  end

  @required_fields ~w(pickup_address dropoff_address customer_name status)a

  def changeset(booking, attrs) do
    booking
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_different_addresses()
  end

  defp validate_different_addresses(changeset) do
    validate_change(changeset, :dropoff_address, fn :dropoff_address, dropoff_address ->
      pickup_address = get_field(changeset, :pickup_address)

      if pickup_address == dropoff_address do
        [dropoff_address: "Pickup and drop-off addresses cannot be the same"]
      else
        []
      end
    end)
  end
end
