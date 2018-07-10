class Admin::CdsController < ApplicationController
  def index
  	@cds = Cd.all
  end

  def new
  	@cd = Cd.new
  	@disc = @cd.discs.build
    @song = @disc.songs.build
  end

  def create
  	cd = cd.new(cd_params)
  	cd.save
  	redirect_to cd_path(cd)
  end

  def edit
    @cd = cd.find(params[:id])
  end

  def update
  	@cd = cd.find(params[:id])
  end

  private
  def cd_params
    params.require(:cd).permit(:title, :image, :price, :genre, :stock, :release, :proceed, discs_attributes:[:id, :number, :_destroy,
    	                                                                                   songs_attributes:[:id, :name, :_destroy]])
  end

end
