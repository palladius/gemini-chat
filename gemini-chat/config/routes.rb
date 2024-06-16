Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/no_auth'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # Added by ricc
  get  '/signout', to: 'sessions#destroy'

  resources :rooms do
    resources :messages
  end
  resources :users

  root 'rooms#index'

end
