class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_logged_user
    return if logged_in?

    redirect_to root_path
  end
  
  private 

  def logged_in?
    if current_user
      return true
    end
    # return true
  end

  # current_user vai ser o usuario de acordo com o :user_id armazenado em sessão

  def current_user
    return session[:user_id] && User.find(session[:user_id])
  end

  
end
