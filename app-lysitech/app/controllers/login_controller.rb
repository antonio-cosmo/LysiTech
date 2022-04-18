class LoginController < ApplicationController
  def index
    exits_login = User.where(username: params[:username], userpassword: params[:userpassword])
  end

end
