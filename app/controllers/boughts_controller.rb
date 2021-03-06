class BoughtsController < ApplicationController
  before_action :authenticate_user!

  protect_from_forgery except: :create

  def index
      @user = User.find_by(id: params[:user_id])
      @boughts = @user.boughts

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def boughtitem_params
        params.require(:boughtitem).permit(:cd_id, :bought_id, :quantity, :subtotal)
    end

    def bought_params
        params.require(:bought).permit(:user_id, :name, :kana, :post, :address, :tel, :status, :ship)
    end
end
