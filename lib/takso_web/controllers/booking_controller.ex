defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  # Renders the form for a new booking
  def new(conn, _params) do
    render(conn, "new.html")
  end

  # Creates a new booking
  def create(conn, %{"booking" => booking_params}) do
    # logic will be handled here
    # For now just redirecting to the index page with a placeholder message.

    conn
    |> put_flash(:info, "Your taxi will arrive in 15 minutes.") # Placeholder message
    |> redirect(to: "/bookings")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
