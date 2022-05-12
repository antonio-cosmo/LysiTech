Rails.application.routes.draw do
  # resources :calls
  # resources :clients
  # resources :phones
  # resources :users
  # resources :profiles
  # resources :profile_types

  #----Login--------
  get '/login', to: 'login#index'
  post '/login', to: 'login#find_user'

  #--------- Dashboard Gerente------------
  get '/admin', to: 'admin#index'
  get '/admin/new_profile', to: 'profiles#new'
  get '/admin/new_client', to: 'clients#new'
  get '/admin/new_call', to: 'calls#new'



  # Pagina padrão
  root "login#index"
end
