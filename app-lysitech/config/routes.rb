Rails.application.routes.draw do

  scope :admin do
    resources :calls, :clients, :phones, :profiles, :profile_types
  end 

  scope :support do
    resources :calls, :clients, :phones
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
