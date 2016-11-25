class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :name, :telephone, :email, :password, :password_confirmation
    end
  end

  def verify_user
    @user = User.find_by_id params[:id]
    unless @user
      flash[:danger] = t "user_not_exist"
      redirect_to users_path
    end
  end
end
