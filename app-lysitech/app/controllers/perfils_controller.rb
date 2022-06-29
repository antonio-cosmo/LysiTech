class PerfilsController < SessionsController
  before_action :require_logged_user
  before_action :is_admin?, only: %i[index new destroy]
  before_action :set_perfil, only: %i[ show edit update destroy ]
  before_action :set_user_session, only: %i[ index show new edit update destroy ]

  def index
    q = params[:search]
    q.strip! if q
    @value_search = q
    @perfils = search(q)
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

    if @user.save and @perfil.save 
      redirect_to perfils_path, notice: "Usuario criado com sucesso." 
    else
      redirect_to new_perfil_path, alert: "Funcionario não cadastrado, informe usuario e senha"
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
    protocols = OrdemServico.where(perfil_id: @perfil.id)

    for protocol in protocols
      protocol.destroy
    end

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

    def search(value)
      if value and value.size > 0
        return Perfil.where("nome ILIKE ?", "%#{value}%").order(:id)
      end
      return Perfil.all.order(:id)
    end

end
