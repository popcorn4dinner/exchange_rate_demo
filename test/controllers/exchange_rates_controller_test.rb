require 'test_helper'

class ExchangeRatesControllerTest < ActionDispatch::IntegrationTest
  test "should get an exchange rate EUR->SEK" do
    get exchange_rates_at_url(exchanged_on: '2018-04-28', from: 'EUR', to: 'SEK')
    assert_response :success
  end

  test "should get an exchange rate EUR->NOK" do
    get exchange_rates_at_url(exchanged_on: '2018-04-28', from: 'EUR', to: 'NOK')
    assert_response :success
  end

  test "should get an exchange rate SEK->EUR" do
    get exchange_rates_at_url(exchanged_on: '2018-04-28', from: 'SEK', to: 'EUR')
    assert_response :success
  end

  test "should get an exchange rate NOK->EUR" do
    get exchange_rates_at_url(exchanged_on: '2018-04-28', from: 'NOK', to: 'EUR')
    assert_response :success
  end

  test "should get an exchange rate NOK->SEK" do
    get exchange_rates_at_url(exchanged_on: '2018-04-28', from: 'NOK', to: 'SEK')
    assert_response :success
  end

  test "should get an exchange rate SEK->NOK" do
    get exchange_rates_at_url(exchanged_on: '2018-04-28', from: 'EUR', to: 'SEK')
    assert_response :success
  end
end
