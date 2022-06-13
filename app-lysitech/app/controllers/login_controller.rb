class LoginController < ApplicationController
  layout "application_login"
  
  def index
    @user = Usuario.new
  end

  def create
    is_user = Usuario.find_by(user_params)
    
    if is_user.ativo                                    
      reset_session                               
      session[:user_id] = is_user.id   
      
      if is_user.gestor
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
    reset_session 
    redirect_to action: "index" 
  end

  private 
    def user_params 
      params.require(:usuario).permit(:usuario, :senha)
    end
  
end
