class UsersController < ApplicationController
  before_action :authenticate_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def authenticate_admin
    unless current_user && current_user.role == "admin"
      redirect_to root_path, alert: "No tienes permisos para acceder a esta página."
    end
  end
end
