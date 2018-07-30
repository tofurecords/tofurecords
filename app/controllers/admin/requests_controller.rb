class Admin::RequestsController < ApplicationController
  before_action :admin

  def index
  	@requests = Request.all

  end

  private
    def request_params
	   params.require(:request).permit(:artist_name,:song_name,:url,:user_name)
    end

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