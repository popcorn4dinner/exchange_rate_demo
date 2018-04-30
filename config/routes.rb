Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/exchange_rates/:exchanged_on/:from/:to', to: 'exchange_rates#at', as: 'exchange_rates_at'
end
