class RootsController < ApplicationController
  def top
  	  @artists = Artist.order("proceed DESC").limit(3)
  	  @cds = Cd.order("proceed DESC").limit(4)
  end
end
