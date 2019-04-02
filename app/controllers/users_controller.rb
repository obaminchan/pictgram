class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit                     # railsはidというカラムを自動的に追加してくれる
    @user = find_user_by_id    # User.find(1) と定義すると/users/1/edit のリクエストには "id"=>"1" というパラメータが付随してる。このパラメータを、コントローラーにて取得するのがpraramsメソッド！！
  end                                  #  paramsメソッドにより取得したidをfindメソッドの引数に渡すことで動的な処理が可能になる！！

  def update
    @user = find_user_by_id
    @user.update(user_params)
    redirect_to root_path, success: '登録に成功しました'
  end

  def destory
    @user = find_user_by_id
    @user.destroy
    redirect_to topics_path
  end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def find_user_by_id
        User.find(params[:id])
      end

end
