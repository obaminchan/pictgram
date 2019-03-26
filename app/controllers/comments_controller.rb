class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
  @comment = Comment.new
  end

  def create
  @comment = current_user.comments.new(comment_params)
  @comment.user_id = current_user.id
  @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to comments_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

      private
       def comment_params
         params.require(:comment).permit(:body)
       end
end





favorite.user_id = current_user.id       #favorite.user_idに現在ログインしているuser(current_user)のidを保存
favorite.topic_id = params[:topic_id]
