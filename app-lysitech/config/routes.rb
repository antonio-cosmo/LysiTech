Rails.application.routes.draw do
  get '/dashboard', to: "dashboard#index"
  post '/dashboard/exist', to: "dashboard#exist"



  # Pagina padrão
  root "login#index"
end
