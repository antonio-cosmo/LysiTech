class TelefoneClientesController < SessionsController
  before_action :set_telefone_cliente, only: %i[ show edit update destroy ]

  # GET /telefone_clientes or /telefone_clientes.json
  def index
    @telefone_clientes = TelefoneCliente.all
  end

  # GET /telefone_clientes/1 or /telefone_clientes/1.json
  def show
  end

  # GET /telefone_clientes/new
  def new
    @telefone_cliente = TelefoneCliente.new
  end

  # GET /telefone_clientes/1/edit
  def edit
  end

  # POST /telefone_clientes or /telefone_clientes.json
  def create
    @telefone_cliente = TelefoneCliente.new(telefone_cliente_params)

    respond_to do |format|
      if @telefone_cliente.save
        format.html { redirect_to telefone_cliente_url(@telefone_cliente), notice: "Telefone cliente was successfully created." }
        format.json { render :show, status: :created, location: @telefone_cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @telefone_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telefone_clientes/1 or /telefone_clientes/1.json
  def update
    respond_to do |format|
      if @telefone_cliente.update(telefone_cliente_params)
        format.html { redirect_to telefone_cliente_url(@telefone_cliente), notice: "Telefone cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @telefone_cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @telefone_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telefone_clientes/1 or /telefone_clientes/1.json
  def destroy
    @telefone_cliente.destroy

    respond_to do |format|
      format.html { redirect_to telefone_clientes_url, notice: "Telefone cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telefone_cliente
      @telefone_cliente = TelefoneCliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telefone_cliente_params
      params.require(:telefone_cliente).permit(:numero_tel, :cliente_id)
    end
end
