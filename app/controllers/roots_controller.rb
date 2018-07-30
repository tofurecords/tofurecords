class RootsController < ApplicationController
  def top
  	  if user_signed_in?
	  	  if current_user.admin?
	  	  	 redirect_to admin_path, notice: '管理者ログイン完了'
	  	  end
	  end
  	  @artists = Artist.order("proceed DESC").limit(3)
  	  @cds = Cd.order("proceed DESC").limit(4)
  end
end
