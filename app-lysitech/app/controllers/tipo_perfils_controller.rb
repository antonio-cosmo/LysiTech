class TipoPerfilsController < SessionsController
  before_action :set_tipo_perfil, only: %i[ show edit update destroy ]

  # GET /tipo_perfils or /tipo_perfils.json
  def index
    @tipo_perfils = TipoPerfil.all
  end

  # GET /tipo_perfils/1 or /tipo_perfils/1.json
  def show
  end

  # GET /tipo_perfils/new
  def new
    @tipo_perfil = TipoPerfil.new
  end

  # GET /tipo_perfils/1/edit
  def edit
  end

  # POST /tipo_perfils or /tipo_perfils.json
  def create
    @tipo_perfil = TipoPerfil.new(tipo_perfil_params)

    respond_to do |format|
      if @tipo_perfil.save
        format.html { redirect_to tipo_perfil_url(@tipo_perfil), notice: "Tipo perfil was successfully created." }
        format.json { render :show, status: :created, location: @tipo_perfil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_perfils/1 or /tipo_perfils/1.json
  def update
    respond_to do |format|
      if @tipo_perfil.update(tipo_perfil_params)
        format.html { redirect_to tipo_perfil_url(@tipo_perfil), notice: "Tipo perfil was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_perfil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_perfils/1 or /tipo_perfils/1.json
  def destroy
    @tipo_perfil.destroy

    respond_to do |format|
      format.html { redirect_to tipo_perfils_url, notice: "Tipo perfil was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_perfil
      @tipo_perfil = TipoPerfil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_perfil_params
      params.require(:tipo_perfil).permit(:tipo)
    end
end
