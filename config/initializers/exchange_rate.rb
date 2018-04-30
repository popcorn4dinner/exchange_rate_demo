ExchangeRate.configure do |c|
  c.provider = ExchangeRate::Providers::Ecb
  c.data_source_path = Rails.root.join('tmp', 'change_rates.xml')
end
