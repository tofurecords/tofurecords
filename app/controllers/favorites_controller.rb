class FavoritesController < ApplicationController
  def index
  end

  def create
  	artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.new(aritst_id: artist.id)
    favorite.save
    redirect_to artists_path(artist)
  end

  def destory
  	artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.find_by(artist_id: params[:artist_id])
    favorite.destroy
    redirect_to artists_path(artists)
  end

end
