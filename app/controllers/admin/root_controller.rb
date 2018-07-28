class Admin::RootController < ApplicationController
	def top
		@artists_p = Artist.order("proceed DESC")
		@artists_f = Artist.joins(:favorites).group(:artist_id).order('count(user_id) desc')
	  	@cds = Cd.order("proceed DESC")
	end
end