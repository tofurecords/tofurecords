class ArtistsController < ApplicationController

  def index
  	@artists = Artist.order("proceed DESC")
    
  end

  def show
  	@artist = Artist.find(params[:id])
  end

  def edit
  	@artist = Artist.find(params[:id])
  end

  def update
  	@artist = Artist.find(params[:id])
  end
end
