defmodule Takso.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :age, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :age])
    |> validate_required([:name, :username, :password, :age])
    |> validate_number(:age, greater_than: 0, less_than_or_equal_to: 120)
  end

end
