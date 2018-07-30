class Admin::CdsController < ApplicationController
  before_action :admin

  def index
  	  @cds = Cd.all
  end

  def new
  	  @cd = Cd.new
  	  @disc = @cd.discs.build
      @song = @disc.songs.build
  end

  def create
  	  cd = Cd.new(cd_params)
      binding.pry
  	  cd.save
  	  redirect_to admin_cds_path(cd)
  end

  def edit
      @cd = Cd.find(params[:id])
      @disc = @cd.discs.build
      @song = @disc.songs.build
  end

  def update
  	  @cd = Cd.find(params[:id])
      @cd.update
  	  redirect_to admin_cds_path(cd)
  end

  def destroy
      @cd = Cd.find(params[:id])
      @cd.destroy
      redirect_to admin_cds_path
  end

  private
   def cd_params
       params.require(:cd).permit(:id, :artist_id, :title, :image, :price, :genre, :stock, :release, :proceed, discs_attributes:[:id, :number, :_destroy,
    	                                                                                   songs_attributes:[:id, :name, :_destroy]])
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