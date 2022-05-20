class ProfileTypesController < SessionsController
  
  before_action :set_profile_type, only: %i[ show edit update destroy ]

  # GET /profile_types or /profile_types.json
  def index
    @profile_types = ProfileType.all
  end

  # GET /profile_types/1 or /profile_types/1.json
  def show
  end

  # GET /profile_types/new
  def new
    @profile_type = ProfileType.new
  end

  # GET /profile_types/1/edit
  def edit
  end

  # POST /profile_types or /profile_types.json
  def create
    @profile_type = ProfileType.new(profile_type_params)

    respond_to do |format|
      if @profile_type.save
        format.html { redirect_to profile_type_url(@profile_type), notice: "Profile type was successfully created." }
        format.json { render :show, status: :created, location: @profile_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_types/1 or /profile_types/1.json
  def update
    respond_to do |format|
      if @profile_type.update(profile_type_params)
        format.html { redirect_to profile_type_url(@profile_type), notice: "Profile type was successfully updated." }
        format.json { render :show, status: :ok, location: @profile_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_types/1 or /profile_types/1.json
  def destroy
    @profile_type.destroy

    respond_to do |format|
      format.html { redirect_to profile_types_url, notice: "Profile type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_type
      @profile_type = ProfileType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_type_params
      params.require(:profile_type).permit(:description)
    end
end
