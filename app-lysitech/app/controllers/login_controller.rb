class LoginController < ApplicationController
  def index
  end

  def exist
    user_exits = User.where(username: params[:username], userpassword: params[:userpassword])
    if user_exits.size > 0 
      redirect_to '/dashboard'
    else
      flash[:alert] = 'Usuario ou senha incorreto'
      redirect_to action: "index"
    end 
  end

  private 

    def login_params 
      params.require(:login).permit(:username, :userpassword)
    end

end
