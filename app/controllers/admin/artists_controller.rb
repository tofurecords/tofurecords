class Admin::ArtistsController < ApplicationController
  def index
  	@artists = Artist.all
  end

  def new
  	@artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    #binding.pry
    redirect_to artist_path(artist.id)
  end

  def show
  	@artist = Artist.find(params[:id])
  	redirect_to artist_path(artist.id)
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def update
  	artist = Artist.find(params[:id])
  	artist.update(artist_params)
  	redirect_to artist_path(artist.id)
  end

  def destroy
  	@artist = Artist.find(params[:id])
  	@artist.destroy
  	redirect_to admin_path
  end

  private
   def artist_params
   	params.require(:artist).permit(:name, :label, :hp, :twitter, :image, :reccomend)
   end
end
