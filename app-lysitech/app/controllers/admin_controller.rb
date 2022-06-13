class AdminController < SessionsController
  before_action :is_admin?
  
  def index
    @usuario = Usuario.find(session[:user_id])
  end

  private 

    def is_admin? 
      user =  Usuario.find(session[:user_id])
      return if user.ativo
      redirect_to root_path
  end

end
