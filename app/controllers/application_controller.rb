class ApplicationController < ActionController::Base # ActionControllerってなに？？？？::Base??

  helper_method :current_user, :logged_in?

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])  # idが'session[:user_id]'のユーザーが検索されている
  end

  def logged_in?
    !current_user.nil?
  end
end
