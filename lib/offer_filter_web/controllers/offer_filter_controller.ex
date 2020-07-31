defmodule OfferFilterWeb.OfferFilterController do
  use OfferFilterWeb, :controller

  def valid(conn, %{"age" => age, "country_code" => country_code, "gender" => gender} = _params) do
    result = OfferFilter.Filter.perform(age, country_code, gender)
    json(conn, %{ status: result, age: age, country_code: country_code, gender: gender })
  end

  def valid(conn, %{"age" => age, "country_code" => country_code } = _params) do
    result = OfferFilter.Filter.perform(age, country_code)
    json(conn, %{ status: result, age: age, country_code: country_code })
  end
end
