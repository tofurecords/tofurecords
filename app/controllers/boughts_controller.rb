class BoughtsController < ApplicationController

  protect_from_forgery except: :create

  def index
      @user = User.find(current_user.id)
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
        params.require(:bought).permit(:name, :kana, :post, :address, :tel, :status)
    end
end
