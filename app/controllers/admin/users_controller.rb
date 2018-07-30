class Admin::UsersController < ApplicationController
  before_action :admin

  def index
		@users = User.all
  end
  def show
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
