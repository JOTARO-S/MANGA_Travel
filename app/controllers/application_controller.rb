class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
   
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはそちらのページへ遷移できません。'
    end
  end
  
end
