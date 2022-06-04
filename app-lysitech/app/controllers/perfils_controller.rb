class PerfilsController < SessionsController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /perfils or /perfils.json
  def index
    @profiles = Perfil.all
  end

  # GET /perfils/1 or /perfils/1.json
  def show
  end

  # GET /perfils/new
  def new
    @profile = Perfil.new
  end

  # GET /perfils/1/edit
  def edit
  end

  # POST /perfils or /perfils.json
  def create
    profile ={
      nome: profile_params[:nome], cpf: profile_params[:cpf], 
      dt_nascimento: profile_params[:dt_nascimento], email: profile_params[:email], 
      rua: profile_params[:rua], numero: profile_params[:numero], 
      bairro: profile_params[:bairro], cidade: profile_params[:cidade], 
      cep: profile_params[:cep], cargo: profile_params[:cargo], 
      tipo_perfil_id: profile_params[:tipo_perfil_id], departamento: profile_params[:departamento]
    }
    @profile = Perfil.new(profile)

    user = {usuario: profile_params[:usuario], senha: profile_params[:senha], perfil: @profile}
    @user = Usuario.new(user)

    respond_to do |format|
      if @profile.save and @user.save
      format.html { redirect_to perfil_url(@profile), notice: "Usuario criado com sucesso." }
      else
      format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfils/1 or /perfils/1.json
  def update
    profile ={
      nome: profile_params[:nome], cpf: profile_params[:cpf], 
      dt_nascimento: profile_params[:dt_nascimento], email: profile_params[:email], 
      rua: profile_params[:rua], numero: profile_params[:numero], 
      bairro: profile_params[:bairro], cidade: profile_params[:cidade], 
      cep: profile_params[:cep], cargo: profile_params[:cargo], 
      tipo_perfil_id: profile_params[:tipo_perfil_id], departamento: profile_params[:departamento]
    }

    user = {usuario: profile_params[:usuario], senha: profile_params[:senha], perfil: @profile}

    respond_to do |format|
      if @profile.update(profile) and @user.update(user)
        format.html { redirect_to profile_url(@profile), notice: "Usuario atualizado." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfils/1 or /perfils/1.json
  def destroy
    @user.destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to perfils_url, notice: "Usuario deletado com sucesso." }
    end
  end


  private
  # configurações ou restrições comuns entre actions.
    def set_profile
      @profile = Perfil.find(params[:id])
      @user = Usuario.find_by(perfil_id: params[:id])
    end

  # Permitir apenas uma lista de parâmetros confiáveis.
    def profile_params
      params.require(:perfil).permit( 
                                        :nome, :cpf, :dt_nascimento, :email, :numero_tel, 
                                        :rua, :numero, :bairro, :cidade, :cep,
                                        :usuario, :cargo, :departamento, :tipo_perfil_id,
                                        :senha
                                    )
    end
end
