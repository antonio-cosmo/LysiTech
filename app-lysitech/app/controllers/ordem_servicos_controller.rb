class OrdemServicosController < SessionsController
  before_action :set_ordem_servico, only: %i[ show edit update destroy ]

  # GET /ordem_servicos or /ordem_servicos.json
  def index
    @ordem_servicos = OrdemServico.all
  end

  # GET /ordem_servicos/1 or /ordem_servicos/1.json
  def show
  end

  # GET /ordem_servicos/new
  def new
    @ordem_servico = OrdemServico.new
  end

  # GET /ordem_servicos/1/edit
  def edit
  end

  # POST /ordem_servicos or /ordem_servicos.json
  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)

    respond_to do |format|
      if @ordem_servico.save
        format.html { redirect_to ordem_servico_url(@ordem_servico), notice: "Ordem servico was successfully created." }
        format.json { render :show, status: :created, location: @ordem_servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordem_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordem_servicos/1 or /ordem_servicos/1.json
  def update
    respond_to do |format|
      if @ordem_servico.update(ordem_servico_params)
        format.html { redirect_to ordem_servico_url(@ordem_servico), notice: "Ordem servico was successfully updated." }
        format.json { render :show, status: :ok, location: @ordem_servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordem_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordem_servicos/1 or /ordem_servicos/1.json
  def destroy
    @ordem_servico.destroy

    respond_to do |format|
      format.html { redirect_to ordem_servicos_url, notice: "Ordem servico was successfully destroyed." }
      format.json { head :no_content }
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
