class Admin::RootController < ApplicationController
	before_action :admin

	def top
		@artists_p = Artist.order("proceed DESC").limit(10)
		@artists_f = Artist.joins(:favorites).group(:artist_id).order('count(user_id) desc')
	  	@cds = Cd.order("proceed DESC").limit(10)
      @requests = Request.all
	end

    private
    def admin
       if user_signed_in?
         if current_user.admin?
         else
           redirect_to root_path
         end
       else
         redirect_to root_path
       end
    end
end
