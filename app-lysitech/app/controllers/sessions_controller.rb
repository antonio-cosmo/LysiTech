class SessionsController < ApplicationController

  def create
    is_user = Usuario.find_by(user_params)
    
    if is_user and is_user.ativo                                    
      reset_session                               
      session[:user_id] = is_user.id  

      if is_user.id == 1
        redirect_to new_login_path
        return
      end 

      redirect_to dashboard_path
      return                                     
    end    
                                                         
    flash[:alert] = "Usuário ou Senha incorretos, tente novamente."
    redirect_to root_path
    
  end

  def destroy
    reset_session 
    redirect_to root_path
  end

  private 
    def user_params 
      params.require(:usuario).permit(:usuario, :senha)
    end

  protected
    def require_logged_user
      return if logged_in? and user_default?

      redirect_to root_path
    end

    def logged_in?
      current_user.present?
    end

    def current_user
      @_current_user ||= session[:user_id] && Usuario.find(session[:user_id])
    end

    def set_user_session
      @usuario_logado = Usuario.find(session[:user_id])
      @perfil_logado = Perfil.find_by(usuario_id: @usuario_logado.id)
    end

    def is_admin? 
      user= Usuario.find(session[:user_id])
      return if user.gestor and user.id != 1
      redirect_to root_path 
    end

    def user_default? 
      user = Usuario.find(session[:user_id])
      return user.id != 1
    end

end