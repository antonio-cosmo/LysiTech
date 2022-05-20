class LoginController < ApplicationController
  layout "application_login"
  

  def index
    @user = User.new
  end

  # def find_user
  #   #Faz a busca do usuario no BD
  #   is_user = User.find_by(user_params)

  #   # Se o usuario existir o redireciona para a pagina do seu perfil
  #   if is_user 
  #     user_type = is_user.profile.profile_type.description
      
  #     if user_type == "manager"
  #       redirect_to '/admin'
  #       return
  #     end

  #     redirect_to '/atend'
  #     return
  #   end

  #   #se não existir o usuario redireciona para a pagina de login e mostra um alerta

  #   flash[:alert] = 'Atenção: Usuario ou senha incorreto!'
  #   redirect_to action: "index"

  # end

  def create
    is_user = User.find_by(user_params)
    
    if is_user # se existir o usuario
      reset_session # destroi a sessão atual
      session[:user_id] = is_user.id   
      user_type = is_user.profile.profile_type.description 

      if user_type == "manager"
        redirect_to admin_path 
        return
      end
      
      redirect_to atend_path
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
      params.require(:user).permit(:username, :userpassword)
    end
  
end
