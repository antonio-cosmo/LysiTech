Rails.application.routes.draw do
  get '/dashboard', to: "dashboard#index"
  post '/dashboard', to: "dashboard#exist"
  root "login#index"
end
