class CdsController < ApplicationController
  def index
      @cds = Cd.all
  end

  def search
      @search = params[:search]
      if @search.present?
         @artists = Artist.search(params[:search])
         @cds = Cd.search(params[:search])
         @songs = Song.search(params[:search])
      else
      end
  end

  def show
  	  @cd = Cd.find(params[:id])
      @cart = current_cart
      @cartitem = @cart.cartitems.build(params[:quantity])
  end

  def create
  	  cd = Cd.new(cd_params)
  	  cd.save
  	  redirect_to admin_cds_path(cd)
  end

  def edit
      @cd = Cd.find(params[:id])
      @disc = @cd.discs.build
      @song = @disc.songs.build
  end

  def update
      cd = Cd.find(params[:id])
      cd.update(cd_params)
      redirect_to admin_cds_path(cd)
  end

  def destroy
      cd = Cd.find(params[:id])
      cd.destroy
      redirect_to admin_cds_path
  end

  private
  def cd_params
    params.require(:cd).permit(:artist_id, :title, :image, :price, :genre, :stock, :release, :proceed, discs_attributes:[:id, :number, :_destroy,songs_attributes:[:id, :name, :_destroy]])
  end

  def cartitem_params
        params.require(:cartitem).permit(:cd_id, :cart_id, :quantity)
  end

end

