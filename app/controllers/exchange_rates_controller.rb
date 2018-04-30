class ExchangeRatesController < ApplicationController
  before_action :validate_params

  def at
    exchanged_on = Date.parse params[exchanged_on]
    begin
      @exchange_rate = ExchangeRate.at exchanged_on, params[:from], params[to]
    rescue ExchangeRate::Errors::RuntimeError => error
      render json: { error: location.errors }, status: :bad_request
    end

  end

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from ActionController::UnpermittedParameters do |pme|
    render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
  end

  private

  def validate_params
    exchange_rate = Validations::ExchangeRate.new(params)
    if !exchange_rate.valid?
      render json: { error: exchange_rate.errors } and return
    end
  end

end
