class UsuariosController < SessionsController
  before_action :require_logged_user
  before_action :is_admin?
  before_action :set_user_session
  before_action :set_usuario, only: %i[ show edit update destroy ]


  def index 
    q = params[:search]
    if q
      q.strip!
      @value_search = q
      @usuarios = search(q)
    end
    @usuarios = search(q)

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

    def search(value)
      if value and value.size > 0
        return Usuario.where("usuario ILIKE ?", "%#{value}%").order(:id)
      end
      return Usuario.all.order(:id)
    end
end