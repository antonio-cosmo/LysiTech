class LoginController < ApplicationController
  layout "application_login"
  
  def index
    @user = Usuario.new
  end

  def create
    is_user = Usuario.find_by(user_params)
    
    if is_user                                    # se existir o usuario
      reset_session                               # destroi a sessão atual
      session[:user_id] = is_user.id   
      user_type = is_user.perfil.tipo_perfil.tipo 

      if user_type == "gerente"
        redirect_to admin_path 
        return
      end
      
      redirect_to support_path
      return                             
                                          
    end    
                                                         
    flash[:alert] = "Usuário ou Senha incorretos, tente novamente."
    redirect_to action: "index"
  end

  def destroy
    reset_session # destroi a sessão atual
    redirect_to action: "index" # direciona para o path de login
  end

  private 
    # metodo para pegar os parametros de login
    def user_params 
      params.require(:usuario).permit(:usuario, :senha)
    end

  # def index
  #   @user = User.new
  # end

  # def create
  #   is_user = User.find_by(user_params)
    
  #   if is_user                                    # se existir o usuario
  #     reset_session                               # destroi a sessão atual
  #     session[:user_id] = is_user.id   
  #     user_type = is_user.profile.profile_type.description 

  #     if user_type == "manager"
  #       redirect_to admin_path 
  #       return
  #     end
      
  #     redirect_to support_path
  #     return                             
                                          
  #   end    
                                                         
  #   flash[:alert] = "Usuário ou Senha incorretos, tente novamente."
  #   redirect_to action: "index"
  # end

  # def destroy
  #   reset_session # destroi a sessão atual
  #   redirect_to action: "index" # direciona para o path de login
  # end

  # private 
  #   # metodo para pegar os parametros de login
  #   def user_params 
  #     params.require(:user).permit(:username, :userpassword)
  #   end
  
end
