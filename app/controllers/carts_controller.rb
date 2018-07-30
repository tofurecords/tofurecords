class CartsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  protect_from_forgery except: :create

  def index
      @carts = Cart.all
  end

  def show
      @bought = Bought.new
      @user = User.find(current_user.id)
      @ship_last = Ship.last
  end

  def new
      @cart = Cart.new
  end

  def edit
  end

  def create

      @bought = Bought.new(bought_params)
      @bought.user_id = current_user.id

      @cart = current_cart
      @cart.user_id = current_user.id

      @ship = Ship.last

      if @bought.ship == "home"
         @bought.name = current_user.name
         @bought.kana = current_user.kana
         @bought.post = current_user.post
         @bought.address = current_user.address
         @bought.tel = current_user.tel
      end

      if @bought.ship == "new"
           @ship = Ship.new
           @ship.user_id = current_user.id
           @ship.name = @bought.name
           @ship.kana = @bought.kana
           @ship.post = @bought.post
           @ship.address = @bought.address
           @ship.tel = @bought.tel
           @ship.save
      end

      if @bought.ship == "registered1"
         @bought.name = @ship.name
         @bought.kana = @ship.kana
         @bought.post = @ship.post
         @bought.address = @ship.address
         @bought.tel = @ship.tel
      end
       if @bought.save

           @cart.cartitems.each do |item|

              @boughtitem = @bought.boughtitems.build
              @boughtitem.cd_id = item.cd_id
              @boughtitem.quantity = item.quantity
              @boughtitem.subtotal = item.cd.price * item.quantity

              @cd = item.cd
              @cd.stock = @cd.stock - item.quantity
              @cd.proceed += item.quantity
              @cd.save

              @artist = @cd.artist
              @artist.proceed += @cd.proceed
              @artist.save

              @boughtitem.save
           end
           Cart.destroy(session[:cart_id])
           session[:cart_id] = nil
           redirect_to user_boughts_path(current_user.id), notice: 'ご注文ありがとうございました。'
       end
  end

  def update
      if @cartitem.update(cart_params)
         redirect_to @cart, notice: 'Cart was successfully updated.'
      else
        render :editend
      end
  end

  def destroy
      @cart = current_cart
      @cart.destroy
      session[:cart_id] = nil
      redirect_to cds_url, notice: 'カートが空になりました。'
  end

  private
    def set_cart
        @cart = Cart.find(params[:id])
    end

    def cart_params
        params.fetch(:cart, {}).permit(:id, cartitems:[:id, :quantity, :cart_id, :cd_id, :_destroy])
    end

    def bought_params
        params.require(:bought).permit(:name, :kana, :post, :address, :tel, :status, :ship)
    end

    def ship_params
        params.require(:ship).permit(:name, :kana, :post, :address, :tel)
    end

    def user_params
    params.require(:user).permit(:name,:kana,:tel,:address,:post,:email)
    end

end