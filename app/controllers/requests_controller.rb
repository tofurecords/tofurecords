class RequestsController < ApplicationController
    before_action :authenticate_user!

	def new
		@request =Request.new
		@user = User.find_by(id: params[:user_id])
	end

	def create
		request = Request.new(request_params)
		request.user_id =current_user.id
		request.save
		redirect_to user_path(current_user)
	end

	def destroy
        request = Request.find(params[:id])
        request.destroy
        redirect_to admin_requests_path
    end

	private
	def request_params
		params.require(:request).permit(:artist_name,:song_name,:url,:user_id)
	end
end