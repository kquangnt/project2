class UsersController < ApplicationController
  before_action :verify_user, only: [:show, :edit, :update]

  def index
    @users = User.order_date_desc.paginate page: params[:page],
      per_page: Settings.per_page.user
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "sign_up_success"
      redirect_to admin_users_path(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :telephone, :email, :password,
      :password_confirmation, :is_admin
  end
end
