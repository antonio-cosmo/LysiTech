class AdminController < SessionsController
  before_action :is_admin?
  
  def index
  end

  private 

    # def is_admin? 
    #     profile =  Profile.find(session[:user_id])
    #     return if profile.profile_type.description  == 'manager'
    #     redirect_to root_path
    # end

    def is_admin? 
      profile =  Perfil.find(session[:user_id])
      return if profile.tipo_perfil.tipo  == 'gerente'
      redirect_to root_path
  end

end
