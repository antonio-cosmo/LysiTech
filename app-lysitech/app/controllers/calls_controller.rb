class CallsController < SessionsController
  before_action :set_call, only: %i[ show edit update destroy ]

  # GET /calls 
  def index
    @calls = Call.all
  end

  # GET /calls/1
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls 
  def create
    @call = Call.new(call_params)

    respond_to do |format|
      if @call.save
        format.html { redirect_to call_url(@call), notice: "Call was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1 or /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to call_url(@call), notice: "Call was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  def destroy
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url, notice: "Call was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_params
      params.require(:call).permit(:title, :description, :begin_date, :end_date, :status, :client_id, :user_id)
    end
end
