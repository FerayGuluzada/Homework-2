defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller


  # Renders the form for a new booking
  def new(conn, _params) do
    render(conn, "new.html")
  end

  # Displays the list of bookings (index page)
  def index(conn, _params) do
    render(conn, "index.html")
  end


  def create(conn, _params) do
    # Handle form submission logic
    conn
    |> put_flash(:info, "Your taxi will arrive in 10 minutes.")
    |> redirect(to: "/bookings")
  end
end
