class ClientesController < SessionsController
  before_action :require_logged_user
  before_action :is_admin?, only: %i[edit update destroy]
  before_action :set_cliente, only: %i[ show edit update destroy ]
  before_action :set_user_session, only: %i[ index show new edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    q = params[:search]
    if q
      q.strip!
      @value_search = q
      @clientes = search(q)
    end
    @clientes = search(q)
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    protocols = OrdemServico.where(cliente_id: @cliente.id)

    for protocol in protocols
      protocol.destroy
    end
    
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(
        :cnpj, :inscr_estadual, :razao_social, :nome_fantasia, 
        :telefone, :email, :rua, :numero, :bairro, :cep, :cidade, :uf, :observacao, :ativo
      )
    end

    def search(value)
      if value and value.size > 0
        return Cliente.where("razao_social ILIKE ?", "%#{value}%").order(:id)
      end
      return Cliente.all.order(:id)
    end
end
