require 'exchange_rate'
require 'exchange_rate/providers/ecb'

ExchangeRate.configure do |c|
  c.provider = ExchangeRate::Providers::Ecb
  c.data_source_path = Rails.root.join('tmp', 'exchange_rates.xml')
end
