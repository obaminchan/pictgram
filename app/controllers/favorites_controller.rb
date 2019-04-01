class FavoritesController < ApplicationController

  def index
    @favorite_topics = current_user.favorite_topics  # 今ログインしている人がいいねをした写真の一覧 (全記事一覧ではない)
  end


  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id       # favorite.user_idに現在ログインしているuser(current_user)のidを保存
    favorite.topic_id = params[:topic_id]    # params[]はリクエストからコントローラーで値を受け取るときに使う # paramsはアクションごとに使われる


    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id:current_user.id, topic_id:params[:topic_id])
    favorite.destroy
    redirect_to topics_path
  end
end
