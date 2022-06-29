class OrdemServicosController < SessionsController
  before_action :require_logged_user
  before_action :set_ordem_servico, only: %i[ show edit update destroy ]
  before_action :set_user_session, only: %i[ index show new edit update destroy ]

  # GET /ordem_servicos or /ordem_servicos.json
  def index
    q = params[:search]

    if @usuario_logado.gestor
      if q and q.size > 0
        q.strip!
        @value_search = q
        @ordem_servicos = OrdemServico.where("titulo ILIKE ?", "%#{q}%").order(:id, :dt_abertura)
      else
        @ordem_servicos = OrdemServico.all.order(:id, :dt_abertura)
      end
    else
      if q and q.size > 0
        q.strip!
        @value_search = q
        @ordem_servicos = OrdemServico.where("perfil_id = ? and titulo ILIKE ?",@perfil_logado, "%#{q}%").order(:id, :dt_abertura)
      else
        @ordem_servicos = OrdemServico.where(perfil_id: @perfil_logado).order(:id, :dt_abertura)
      end
    end
  end

  # GET /ordem_servicos/1 or /ordem_servicos/1.json
  def show
    @perfil = Perfil.find(@ordem_servico.perfil_id)
    @cliente = Cliente.find(@ordem_servico.cliente_id)
  end

  # GET /ordem_servicos/new
  def new
    @ordem_servico = OrdemServico.new
    @clientes = Cliente.all
    @perfil = @perfil_logado
  end

  # GET /ordem_servicos/1/edit
  def edit
    @perfil = Perfil.find(@ordem_servico.perfil_id)
    @cliente = Cliente.find(@ordem_servico.cliente_id)
  end

  # POST /ordem_servicos or /ordem_servicos.json
  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)

    respond_to do |format|
      if @ordem_servico.save
        format.html { redirect_to ordem_servicos_path, notice: "Ordem servico was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordem_servicos/1 or /ordem_servicos/1.json
  def update
    respond_to do |format|
      if @ordem_servico.update(ordem_servico_params)
        format.html { redirect_to ordem_servicos_path, notice: "Ordem servico was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordem_servicos/1 or /ordem_servicos/1.json
  def destroy
    @ordem_servico.destroy

    respond_to do |format|
      format.html { redirect_to ordem_servicos_url, notice: "Ordem servico was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordem_servico
      @ordem_servico = OrdemServico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordem_servico_params
      params.require(:ordem_servico).permit(:titulo, :categoria, :descricao, :solucao, :estatus, :dt_abertura, :dt_encerramento, :perfil_id, :cliente_id)
    end

end
