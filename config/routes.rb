Rails.application.routes.draw do
  # get "up" => "rails/health#show", as: :rails_health_check

  root to: 'main#index'

  resources 'products'

  resources 'employees'

  resources 'targets', except: %i[show]


  resources 'storages', except: %i[show create destroy]

  resources 'users'

  resource 'session', only: %i[new create destroy]

  #--orders--

  resources 'orders', except: %i[show create]

  get '/arrival_of_goods', to: 'orders#arrival_of_goods'
  get '/consumption_of_goods', to: 'orders#consumption_of_goods'

  post '/create_arrival_of_goods', to: 'orders#create_arrival_of_goods'
  post '/create_consumption_of_goods', to: 'orders#create_consumption_of_goods'
end
