class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :game_master?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon])
  end

  def after_sign_in_path_for(resource)
    recruitments_path
  end
  
  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  private

  def game_master?
    @recruitment.master_name == current_user.name
  end
end
