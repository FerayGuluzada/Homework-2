defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Takso.Sales.Taxi
  alias Takso.Repo
  alias Takso.Sales


  # Renders the form for a new booking
  def new(conn, _params) do
    render(conn, "new.html")
  end

  # Displays the list of bookings (index page)
  def index(conn, _params) do
    render(conn, "index.html")
  end


  def create(conn, %{"pickup_address" => pickup_address, "dropoff_address" => dropoff_address}) do
    # Query to count available taxis
    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)

    if available_taxis == [] do
      # Handle the rejection case
      conn
      |> put_flash(:error, "At present, there is no taxi available!")
      |> redirect(to: "/bookings/new")
    else
      # Handle the acceptance case
      conn
      |> put_flash(:info, "Your taxi will arrive in X minutes!")  # Replace X with actual time
      |> redirect(to: "/bookings/confirmation")
    end
  end



  def show(conn, %{"id" => id}) do
    booking = Sales.get_booking!(id)
    render(conn, "show.html", booking: booking)
  end


end
