class Admin::BaseController < ApplicationController
   before_action :verify_admin

  protected
  def verify_admin
    redirect_to root_url unless current_user.is_admin?
  end
end
