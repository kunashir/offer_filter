defmodule OfferFilterWeb.PageController do
  use OfferFilterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
