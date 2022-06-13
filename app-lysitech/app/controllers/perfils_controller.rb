class PerfilsController < SessionsController
  before_action :set_perfil, only: %i[ show edit update destroy ]
  before_action :set_user_session, only: %i[ index show new edit update destroy ]

  def index
    @perfils = Perfil.all.order(:nome)
    @usuario = Usuario.find(session[:user_id])
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

    respond_to do |format|
      if @perfil.save and @user.save
        format.html { redirect_to perfil_path(@perfil), notice: "Usuario criado com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @user.update(usuario_params) and @perfil.update(**perfil_params, usuario: @user)
      redirect_to perfil_url(@perfil), notice: "Usuario atualizado." 
    else
      render :edit, status: :unprocessable_entity 
    end
   
  end

  def destroy

    @perfil.destroy
    @user.destroy

    redirect_to perfils_url, notice: "Usuario deletado com sucesso." 
  
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
