Rails.application.routes.draw do
  resources :calls
  resources :clients
  resources :phones
  resources :users
  resources :profiles
  resources :profile_types

  get '/login', to: 'login#index'
  post '/login', to: 'login#find_user'

  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/new_profile', to: 'profiles#new'
  get '/dashboard/new_client', to: 'clients#new'
  get 'dashboard/new_call', to: 'calls#new'



  # Pagina padrão
  root "login#index"
end
