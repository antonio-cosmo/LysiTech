class LoginController < ApplicationController
  layout "application_login"
  
  def index
  end

  def find_user

    name = params[:username]
    password = params[:userpassword]

    is_user = User.find_by(username: name, userpassword: password)

    if is_user 
      redirect_to '/dashboard'
    else
      flash[:alert] = 'Atenção: Usuario ou senha incorreto!'
      redirect_to action: "index"
    end 

  end
  
end
