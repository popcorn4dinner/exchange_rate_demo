require 'exchange_rate/errors/invalid_currency'
require 'exchange_rate/errors/invalid_exchange_date'

class ExchangeRatesController < ApplicationController
  before_action :validate_params

  def at
    exchanged_on = Date.parse params[:exchanged_on]

    begin
      
      render json: {
               exchange_rate: {
                 from: params[:from],
                 to: params[:to],
                 exchanged_on: params[:exchanged_on],
                 rate: ExchangeRate.at(exchanged_on, params[:from], params[:to])
               }
             }

    rescue ExchangeRate::Errors::InvalidExchangeDate => error
      render_runtime_error error
    rescue ExchangeRate::Errors::InvalidCurrency => error
      render_runtime_error error
    end

  end

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from ActionController::UnpermittedParameters do |pme|
    render json: { error:  { unknown_parameters: pme.params } }, status: :bad_request
  end

  private

  def validate_params
    exchange_rate = Validations::ExchangeRate.new params
    if !exchange_rate.valid?
      render json: { error: exchange_rate.errors } and return
    end
  end

  def render_runtime_error(error)
    render json: { error: error.message }, status: :bad_request and return
  end

end
