class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new(comment_params)
    @comment.topic_id = @topic.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      @comments = @topic.comments.page(params[:page])
      @current_user = current_user
      @tweet_new = Tweet.new
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
