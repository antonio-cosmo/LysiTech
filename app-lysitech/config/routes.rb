Rails.application.routes.draw do

  scope :dashboard do
    resources :ordem_servicos, :clientes, :perfils, :usuarios
  end 
  resources :login
  #----Login--------
  post '/sign_in', to:'sessions#create'
  get  '/sign_out', to:'sessions#destroy', as: :logout


  #--------- Dashboard ------------
  get '/dashboard', to: 'dashboard#index'

  # Pagina padrão
  root 'login#index'

end
