class LoginController < ApplicationController
  layout "application_login"
  

  def index
  end

  def find_user
    #Faz a busca do usuario na BD
    is_user = User.find_by(user_params)

    # Se o usuario existir autentica o usuario, se não, redireciona para a pagina de login e notifica um alerta
    if is_user 
      redirect_to '/admin'
    else
      flash[:alert] = 'Atenção: Usuario ou senha incorreto!'
      redirect_to action: "index"
    end 

  end

  private 
    # metodo para pegar os parametros do login
    def user_params 
      params.require(:user).permit(:username, :userpassword)
    end
  
end
