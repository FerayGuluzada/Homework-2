defmodule Takso.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :customer_name, :string
      add :pickup_location, :string
      add :dropoff_location, :string
      add :status, :string

      timestamps()
    end
  end
end
