Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/no_auth'

  devise_scope :user do
    # Redirests signing out users back to sign-in
    # get "users", to: "devise/sessions#new"
    get 'signin', to: 'devise/sessions#new' # https://henrytabima.github.io/rails-setup/docs/devise/configuring-routes
    get 'login', to: 'devise/sessions#new' # https://henrytabima.github.io/rails-setup/docs/devise/configuring-routes
    get 'signout', to: 'devise/sessions#destroy' # unblocks the recursive loop
    get 'logout', to: 'devise/sessions#destroy'

  end
  devise_for :users
  # se no non va
  resources :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  ################
  # before Devise
  # signin_path => sessions_new_path
  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # delete '/signout', to: 'sessions#destroy'
  # # # # Added by ricc
  # get  '/signout', to: 'sessions#destroy'
  ################
  # after  Devise
  #get '/signin', to: 'users#sign_in' # nope
  #get '/signin', to: '/users/sign_in'
 # get 'signin', to: 'devise/sessions#new'


  resources :rooms do
    resources :messages
  end

  # Defines the root path route ("/")
  root 'rooms#index'

end
