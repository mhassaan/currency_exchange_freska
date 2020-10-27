Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "exchange_rates/latest", to: "exchange_rates#latest"
  get "exchange_rates/historical", to: "exchange_rates#historical"
end
