class ProfilesController < SessionsController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles 
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or 
  def create
    
    profile ={
              fullname: profile_params[:fullname], cpf: profile_params[:cpf], 
              birth_date: profile_params[:birth_date], email: profile_params[:email], 
              street: profile_params[:street], house_number: profile_params[:house_number], 
              district: profile_params[:district], city: profile_params[:city], 
              cep: profile_params[:cep], office: profile_params[:office], 
              profile_type_id: profile_params[:profile_type_id], department: profile_params[:department]
            }
    @profile = Profile.new(profile)

    user = {username: profile_params[:username], userpassword: profile_params[:userpassword], profile: @profile}
    @user = User.new(user)

    respond_to do |format|
      if @profile.save and @user.save
        format.html { redirect_to profile_url(@profile), notice: "Usuario criado com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Usuario atualizado." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 
  def destroy
    @user.destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Usuario deletado com sucesso." }
    end
  end

  private
    # configurações ou restrições comuns entre actions.
    def set_profile
      @profile = Profile.find(params[:id])
      @user = User.find_by(profile_id: params[:id])
    end

    # Permitir apenas uma lista de parâmetros confiáveis.
    def profile_params
      params.require(:profile).permit( 
                                        :fullname, :cpf, :birth_date, :email, :phone_num, 
                                        :street, :house_number, :district, :city, :cep,
                                        :username, :office, :department, :profile_type_id,
                                        :userpassword
                                     )
    end
end
