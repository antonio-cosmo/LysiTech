class LoginController < ApplicationController
  layout "application_login"
  before_action :set_perfil, only: %i[ show edit update destroy ]

  def index
    @user = Usuario.new
  end

  def show
  end

  def new
  end

  def edit
  end

  def create

    @user = Usuario.new(usuario_params)
    @perfil = Perfil.new(**perfil_params, usuario: @user)
   
    if @perfil.save and @user.save
      redirect_to login_path(@perfil)
    else
      render :new
    end
  
  end

  def update
    if @user.update(usuario_params) and @perfil.update(**perfil_params, usuario: @user)
      redirect_to login_path(@perfil)
    else
      render :edit, status: :unprocessable_entity 
    end
   
  end




  private
    
    def set_perfil
      @perfil = Perfil.find(params[:id])
      @user = Usuario.find(@perfil.usuario_id)
    end
   
    def perfil_params
      params.require(:perfil).permit(
        :nome, :cpf, :sexo, :dt_nascimento, :email, :telefone, :rua, :numero, :bairro,  
        :cidade, :cep,:uf, :cargo, :departamento
      )
    end

    def usuario_params
      params.require(:user).permit(:usuario, :senha, :gestor, :ativo)
    end
  
  
end
