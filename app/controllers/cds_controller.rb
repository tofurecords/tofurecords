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
    params.require(:cd).permit(:id, :artist_id, :title, :image, :price, :genre, :stock, :release, :proceed, discs_attributes:[:id, :number, :_destroy,
                                                                                         songs_attributes:[:id, :name, :_destroy]])
  end

end
