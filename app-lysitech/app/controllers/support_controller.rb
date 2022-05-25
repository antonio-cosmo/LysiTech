class SupportController < SessionsController
  before_action :is_support?
  
  def index
  end

  private 

    def is_support? 
        profile =  Profile.find(session[:user_id])
        return if profile.profile_type.description  == 'support'
        redirect_to root_path
    end
end
