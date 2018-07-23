class CdsController < ApplicationController
def index

  @cds = Cd.all

 puts "aaaaaaaaaaaaaaaaaaaa#{current_user.id}"

  end

 #  def search
 #    @cds = params[:search]
 #   if @cds.present?
 #      @cds = Cd.search(params[:search])
 #    end

 #   @songs = params[:search]
 #   # binding.pry
 #   if @songs.present?
 #      @songs = Song.search(params[:search])
 #   end
 # end


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
    params.require(:cd).permit(:artist_id, :title, :image, :price, :genre, :stock, :release, :proceed, discs_attributes:[:id, :number, :_destroy,songs_attributes:[:id, :name, :_destroy]])
  end
  def disc_params
    params.require(:disc).permit(:cd_id,:number)
  end
  def song_params
    params.require(:song).permit(:disc_id,:name)
  end

end

