class DashboardController < ApplicationController
  def exist
    user_exits = User.where(username: params[:username], userpassword: params[:userpassword])
    if user_exits.size > 0 
      render :index
    end 
  end

  def index
  end
end
