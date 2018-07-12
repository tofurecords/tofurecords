class RequestsController < ApplicationController
	def new
		@request =Request.new
	end
	def create
		request = Request.new(request_params)
		request.save
		redirect_to new_request_path
	end


	private
	def request_params
		params.require(:request).permit(:artist_name,:song_name,:url)
	end
end