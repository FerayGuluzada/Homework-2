defmodule Takso.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :customer_name, :string
      add :pickup_address, :string  
      add :dropoff_address, :string
      add :status, :string

      timestamps()
    end
  end
end
