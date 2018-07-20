class RootsController < ApplicationController
  def top
  	  @artists = Artist.order("proceed DESC").limit(3)
  end
end
