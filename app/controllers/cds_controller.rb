class CdsController < ApplicationController
  def index
  end

  def show
  	@cd=Cd.find(params[:id])
  end

  def create
  	cd = Cd.new(cd_params)
  	cd.save
  	redirect_to admin_cds_path(cd)
  end

  private
  def cd_params
    params.require(:cd).permit(:artist_id, :title, :image, :price, :genre, :stock, :release, :proceed, discs_attributes:[:id, :number, :_destroy,  	                                                                                   songs_attributes:[:id, :name, :_destroy]])
  end

end
