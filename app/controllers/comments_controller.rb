class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new(comment_params)
    @comment.topic_id = @topic.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topic_path(@topic)
    else
      @comments = @topic.comments.page(params[:page])
      flash.now[:error] = 'コメントの投稿に失敗しました。'
      render "topics/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, images: [])
  end
end
