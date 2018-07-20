class CartsController < ApplicationController

  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  protect_from_forgery except: :create

  def index
      @carts = Cart.all
  end

  def show
      @bought = Bought.new
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
      #binding.pry

      if @bought.save
       # binding.pry
         @ship = Ship.new
         @ship.user_id = current_user.id
         @ship.name = @bought.name
         @ship.kana = @bought.kana
         @ship.post = @bought.post
         @ship.address = @bought.address
         @ship.tel = @bought.tel
         @ship.save

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
         #binding.pry
         Cart.destroy(session[:cart_id])
         session[:cart_id] = nil
         redirect_to boughts_path(current_user.id), notice: 'ご注文ありがとうございました。'
       else
      end
  end

=begin
  def create
      @cart = Cart.new(cart_params)

      if @cart.save
         redirect_to @cart, notice: 'Cart was successfully created.'
      else
        render :new
      end
  end
=end

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
        params.require(:bought).permit(:name, :kana, :post, :address, :tel, :status)
    end

    def ships_params
        params.require(:ship).permit(:name, :kana, :post, :address, :tel)
    end

end