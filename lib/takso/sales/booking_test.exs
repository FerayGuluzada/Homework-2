defmodule Takso.Sales.BookingTest do
  use ExUnit.Case
  alias Takso.Sales.Booking

  test "booking requires a 'pickup address'" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: nil, dropoff_address: "Liivi 2", customer_name: "John Doe", status: "confirmed"})
    assert Keyword.has_key?(changeset.errors, :pickup_address)
  end

  test "booking requires a 'dropoff address'" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: "Liivi 1", dropoff_address: nil, customer_name: "John Doe", status: "confirmed"})
    assert Keyword.has_key?(changeset.errors, :dropoff_address)
  end

  test "pickup and dropoff addresses cannot be the same" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: "Liivi 1", dropoff_address: "Liivi 1", customer_name: "John Doe", status: "confirmed"})
    assert Keyword.has_key?(changeset.errors, :dropoff_address)
  end
end
