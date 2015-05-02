class Admin::UsersController < ApplicationController

  before_filter :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to :back
  end

private

  def user_params
    params.require(:user).permit(*User.attribute_names)
  end

end
