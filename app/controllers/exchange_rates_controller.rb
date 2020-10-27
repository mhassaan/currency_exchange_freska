class ExchangeRatesController < ApplicationController
  include ExchangeService
  include Validations
  before_action :validate_exchange_currency_params, only: [:historical]

  def latest
    response = exchange_rate.latest
    render json: response
  end

  def historical
    response = exchange_rate.historical
    render json: response
  end

  private

  def validate_exchange_currency_params
    exchange_rate_params = Validations::ExchangeRate.new(params)
    unless exchange_rate_params.valid?
      render json: { error: exchange_rate_params.errors }
    end
  end

  def exchange_rate
    service = ExchangeService::ExchangeRate.new(params)
  end
end
