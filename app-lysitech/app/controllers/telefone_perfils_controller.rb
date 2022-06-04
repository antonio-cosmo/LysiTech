class TelefonePerfilsController < SessionsController
  before_action :set_telefone_perfil, only: %i[ show edit update destroy ]

  # GET /telefone_perfils or /telefone_perfils.json
  def index
    @telefone_perfils = TelefonePerfil.all
  end

  # GET /telefone_perfils/1 or /telefone_perfils/1.json
  def show
  end

  # GET /telefone_perfils/new
  def new
    @telefone_perfil = TelefonePerfil.new
  end

  # GET /telefone_perfils/1/edit
  def edit
  end

  # POST /telefone_perfils or /telefone_perfils.json
  def create
    @telefone_perfil = TelefonePerfil.new(telefone_perfil_params)

    respond_to do |format|
      if @telefone_perfil.save
        format.html { redirect_to telefone_perfil_url(@telefone_perfil), notice: "Telefone perfil was successfully created." }
        format.json { render :show, status: :created, location: @telefone_perfil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @telefone_perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telefone_perfils/1 or /telefone_perfils/1.json
  def update
    respond_to do |format|
      if @telefone_perfil.update(telefone_perfil_params)
        format.html { redirect_to telefone_perfil_url(@telefone_perfil), notice: "Telefone perfil was successfully updated." }
        format.json { render :show, status: :ok, location: @telefone_perfil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @telefone_perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telefone_perfils/1 or /telefone_perfils/1.json
  def destroy
    @telefone_perfil.destroy

    respond_to do |format|
      format.html { redirect_to telefone_perfils_url, notice: "Telefone perfil was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telefone_perfil
      @telefone_perfil = TelefonePerfil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telefone_perfil_params
      params.require(:telefone_perfil).permit(:numero_tel, :perfil_id)
    end
end
