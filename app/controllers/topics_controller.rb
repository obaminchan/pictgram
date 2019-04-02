class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)  # 全記事の一覧       #インスタンス変数・・・インスタンスごとに独立した変数 ”さる”“ぞう”
  end                                              # Railsはtopic_idを自動的に追加してくれる


  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)


    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destory
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end




  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end


end
