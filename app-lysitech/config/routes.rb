Rails.application.routes.draw do

  scope :admin do
    resources :ordem_servicos, :clientes, :perfils
  end 

  scope :support do
    resources :ordem_servicos, :clientes
  end 


  
  #----Login--------
  post '/sign_in', to:'login#create',  as: :login
  get  '/sign_out', to:'login#destroy', as: :logout


  #--------- Dashboard ------------
  get '/admin', to: 'admin#index'
  get '/support', to: 'support#index'
 

  # Pagina padrão
  root 'login#index'
end
