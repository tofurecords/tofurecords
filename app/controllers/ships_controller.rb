class ShipsController < ApplicationController
  def new
  end

  def index
  	  @ships = Ship.all
  	  #@ships = Ship.find(current_user.id)
  end

  def edit
  end

  def destroy
  end

  private
    def ships_params
        params.require(:ship).permit(:name, :kana, :post, :address, :tel)
    end
end
