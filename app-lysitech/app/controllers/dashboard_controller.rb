class DashboardController < ApplicationController

  def index
  end

  def exist
    error = []
    user_exits = User.where(username: params[:username], userpassword: params[:userpassword])
    if user_exits.size > 0 
      redirect_to action: index
    else
      respond_to do |format|
        format.html {redirect_to root_path , notice: 'Usuario ou senha incorreto' }
      end
    end 
  end
end
