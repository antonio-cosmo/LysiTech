class UsuariosController < SessionsController
  before_action :require_logged_user
  before_action :is_admin?
  before_action :set_user_session
  before_action :set_usuario, only: %i[ show edit update destroy ]


  def index 
    @usuarios = Usuario.all.order(:id)
  end

  def show 
  end

  def edit 
  end

  def update
    if @user.update(usuario_params)
      redirect_to usuario_url(@user), notice: "Usuario atualizado." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private 
    def set_usuario
      @user = Usuario.find(params[:id])
    end

    def usuario_params
      params.require(:usuario).permit(:usuario, :senha, :gestor, :ativo)
    end
end