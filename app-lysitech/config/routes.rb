Rails.application.routes.draw do
  resources :calls
  resources :clients
  resources :phones
  resources :users
  resources :profiles
  resources :profile_types
  get '/login', to: 'login#index'
  post '/login', to: "login#exist"
  get '/dashboard', to: "dashboard#index"



  # Pagina padrão
  root "login#index"
end
