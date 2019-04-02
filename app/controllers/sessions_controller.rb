class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

    private
     def log_in(user)                  #log_inメソッドでsession[:user_id]にログイン情報を保存している
    session[:user_id] = user.id        #sessionメソッドはRailsにもともと定義されているメソッドで、暗号化して保存するためのメソッド
     end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

private
def session_params
  params.require(:session).permit(:email)
end

 private
  def password_params
    params.require(:session).permit(:password)
  end
end
