defmodule OfferFilter.Repo do
  use Ecto.Repo,
    otp_app: :offer_filter,
    adapter: Ecto.Adapters.MyXQL
end
