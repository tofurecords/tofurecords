class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
    if @user == current_user or current_user.admin?
    else
       redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user or current_user.admin?
    else
       redirect_to user_path(current_user), notice: '変更出来ませんでした'
    end
  end
  def update
     user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_path(user.id), notice: '変更完了'
  end
  def destroy
    user = User.find(params[:id])
      if user.admin?
         redirect_to admin_users_path, notice: '管理者は削除出来ません'
      else
         user.destroy
         redirect_to admin_users_path, notice: '削除完了'
      end
  end

  def favorites
    @user = User.find_by(id: params[:user_id])
    @favorites = Favorite.where(user_id: @user.id).all
  end

  private
  def user_params
    params.require(:user).permit(:name,:kana,:tel,:address,:post,:email,:encrypted_password)
  end
  def admin_user
   redirect_to(root_path) unless current_user.admin?
  end
end
