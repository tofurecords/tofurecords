class Admin::RequestsController < ApplicationController
  def index
  	@requests = Request.all

  end

  
private
def request_params
	params.require(:request).permit(:artist_name,:song_name,:url,:user_name)

end
end