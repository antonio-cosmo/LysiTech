Rails.application.routes.draw do
  get 'atend/index'
  scope :admin do
    resources :calls, :clients, :phones, :profiles, :profile_types
  end 

  scope :atend do
    resources :calls, :clients, :phones
  end 
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
  get '/atend', to: 'atend#index'
  # get '/admin/profiles', to: 'profiles#index'
  # get '/admin/new_profile', to: 'profiles#new'
  # get '/admin/profile/:id', to: 'profiles#edit'
  # patch '/admin/profile/:id', to: 'profiles#update'
  # get '/admin/new_client', to: 'clients#new'
  # get '/admin/new_call', to: 'calls#new'

  # post 'admin/profile', to: 'profiles#create'

  # Pagina padrão
  root "login#index"
end
