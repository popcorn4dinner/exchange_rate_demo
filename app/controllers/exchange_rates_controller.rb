class ExchangeRatesController < ApplicationController
  before_action :validate_params

  def at
    exchanged_on = Date.parse exchange_rate_params[exchanged_on] rescue nil
   

    unless exchanged_on.present? && 

    end
  end

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
  end

  private

  def exchange_rate_params
    params.permit(:exchanged_on, :from, :to)
  end

  def validate_currencies
    from = exchange_rate_params[:from]
    to = exchange_rate_params[:to]

    unless valid_currency?
    end
  end

  def valid_currency?(currency)
    allowed_currencies.include?(currency)
  end

  def allowed_currencies
    ['EUR', 'SEK', 'NOK']
  end

end

