class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    user_path(@user)
  end
  def after_sign_up_path_for(resource)
    user_path(@user)
  end

  def after_sign_out_path_for(resource)
    new_user_registration_path
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:kana,:post,:address,:tel])
  end

  helper_method :current_cart


  private
  def current_cart
    # sessionはハッシュのようにアクセスできる
    begin
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      # 新しいカートを作成する(DBも書き込む)
      cart = Cart.create
      session[:cart_id] = cart.id
      #cart.user_id = current_user.id
      cart
    end
  end

end
