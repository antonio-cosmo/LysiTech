class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_logged_user
    return if logged_in?

    redirect_to root_path
  end
  
  private 

    def logged_in?
      current_user.present?
    end

    def current_user
      @_current_user ||= session[:user_id] && Usuario.find_by(id: session[:user_id])
    end

  
end
