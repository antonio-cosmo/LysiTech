class SessionsController < ApplicationController
  before_action :require_logged_user

  protected

    def set_user_session
      @usuario = Usuario.find(session[:user_id])
    end
end