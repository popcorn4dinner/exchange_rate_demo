require 'test_helper'

class ExchangeRatesControllerTest < ActionDispatch::IntegrationTest
  test "should get at" do
    get exchange_rates_at_url
    assert_response :success
  end

end
