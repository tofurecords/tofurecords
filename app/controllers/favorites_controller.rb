class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end


  def create
    user = current_user
    artist = Artist.find(params[:artist_id])
    Favorite.create(user_id: user.id, artist_id: artist.id)
    redirect_to artist_path(artist.id)
  end

  def destroy
  	user=current_user
    artist=Artist.find(params[:artist_id])
    favorite=Favorite.find_by(user_id: user.id,artist_id: artist.id)
    favorite.delete
    redirect_to artist_path(artist.id)
  end

end
