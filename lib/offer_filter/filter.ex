defmodule OfferFilter.Filter do
  def perform(age, country_code, gender \\ nil) do
    async_query(&filter_by_panel_user_geneder/1, gender)
    async_query(&filter_by_panel_user_age/1, age)
    async_query(&filter_by_panel_user_country_code/1, country_code)
    result = 1..3 |> Enum.any?(fn(_) ->
      %{ result: result} = get_result()
      result == :bad
    end)
  end

  defp filter_by_panel_user_geneder(gender) do
    if gender == "male", do: %{ result: :ok }, else: %{ result: :bad }
  end

  defp filter_by_panel_user_age(age) do
    :timer.sleep(1000)
    %{ result: :ok }
  end

  defp filter_by_panel_user_country_code(country_code) do
    :timer.sleep(2000)
    %{ result: :bad }
  end

  defp get_result do
    receive do
      { :result, result } -> result
    end
  end

  def async_query(func, params) do
    caller = self
    spawn(fn ->
      send(caller, {:result, func.(params)})
    end)
  end
end
