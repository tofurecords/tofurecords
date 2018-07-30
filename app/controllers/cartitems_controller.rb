class CartitemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cartitem, only: [:show, :edit]

  def index
      @cartitems = Cartitem.all
  end

  def show
  end

  def new
      @cartitem = Cartitem.new
  end

  def edit
  end

=begin
  def create
      @cart = current_cart
      #cd = Cd.find(params[:cd_id])
      @cartitem = Cartitem.find_by(cart_id: params[:cart_id], id: params[:id])
      @cartitem = @cart.cartitems.find_by(cd_id: params[:cd_id])
      if @cartitem.blank?
         @cartitem.quantity += params[:quantity].to_i
      else
         @cartitem = @cart.cartitems.build(cd_id: params[:cd_id])
      end
  end
=end

=begin
  def create
      @cart = current_cart
      @cartitem = @cart.cartitems.find_by(cd_id: params[:cd_id])
      if @cartitem.blank?
       @cartitem = @cart.cartitems.build(cd_id: params[:cd_id])
      else
      @cartitem.quantity += params[:quantity].to_i
      end
      binding.pry
      @cartitem.save
      redirect_to current_cart
  end
=end

  def create
	    @cart = current_cart
	    cd = Cd.find(params[:cd_id])
	    @cartitem = @cart.add_cd(cd.id)

      if @cartitem.save
        redirect_to @cartitem.cart, notice: 'カートに商品が追加されました。'
      else
        render :new
      end
  end

  def update
      @cartitem = Cartitem.find_by(cart_id: params[:cart_id], id: params[:id])
      if @cartitem.update(cartitem_params)
         redirect_to @cartitem.cart, notice: 'カートが更新されました。'
      else
         render :edit
      end
  end

  def destroy
      @cartitem = Cartitem.find_by(cart_id: params[:cart_id], id: params[:id])
      @cartitem.destroy
      redirect_to cart_url(@cartitem.cart_id), notice: '商品をカートから削除しました。'
  end

  private
    def set_cartitem
        @cartitem = Cartitem.find(params[:id])
    end

    def cartitem_params
        params.require(:cartitem).permit(:cd_id, :cart_id, :quantity)
    end
end
