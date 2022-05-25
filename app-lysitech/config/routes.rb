Rails.application.routes.draw do
  get 'atend/index'
  scope :admin do
    resources :calls, :clients, :phones, :profiles, :profile_types
  end 

  scope :atend do
    resources :calls, :clients, :phones
  end 
  
  #----Login--------
  post '/sign_in', to:'login#create',  as: :login
  get  '/sign_out', to:'login#destroy', as: :logout


  #--------- Dashboard ------------
  get '/admin', to: 'admin#index'
  get '/atend', to: 'atend#index'
 

  # Pagina padrão
  root 'login#index'
end
