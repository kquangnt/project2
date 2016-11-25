class Admin::UsersController < Admin::BaseController
  before_action :verify_user, only: [:show, :edit, :update]

  def index
    @users = User.order_date_desc.paginate page: params[:page],
      per_page: Settings.per_page.user
  end

  def show
  end

  def new
    @user = User.new
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

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_updated"
      redirect_to admin_users_url(@user)
    else
      render :edit
    end
  end

  def destroy
    User.find_by_id(params[:id]).destroy
    flash[:success] = t "user_deleted"
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit :name, :telephone, :email, :password,
      :password_confirmation, :is_admin
  end

  def verify_user
    @user = User.find_by_id params[:id]
    unless @user
      flash[:danger] = t "user_not_exist"
      redirect_to users_path
    end
  end
end
