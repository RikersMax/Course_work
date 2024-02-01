Rails.application.routes.draw do

  #get "up" => "rails/health#show", as: :rails_health_check

  root to: 'main#index'

  resources 'products'
  resources 'targets', except: %i[show]

  resources 'orders'

end
