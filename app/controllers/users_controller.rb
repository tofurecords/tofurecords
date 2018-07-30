class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end
  def update
     user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_path(user.id)
  end

  def favorites
    @user = User.find_by(id: params[:user_id])
    @favorites = Favorite.where(user_id: @user.id).all
  end

  private
  def user_params
    params.require(:user).permit(:name,:kana,:tel,:address,:post,:email,:encrypted_password)
  end
end
