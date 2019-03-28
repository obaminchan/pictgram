class CommentsController < ApplicationController
  def index
   @comment_topics = current_user.comment_topics
  end

  def new
  @comment = Comment.new
  @topic_id = params[:topic_id]   #newアクションでtopic_idをparamsに格納する
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
