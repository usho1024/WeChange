class RepliesController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy]

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.new(reply_params)
    @reply.tweet_id = @tweet.id
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to request.referer
    else
      @replies = @tweet.replies.page(params[:page])
      @current_user = current_user
      @tweet_new = Tweet.new
      @user = @tweet.user
      render 'tweets/show'
    end
  end

  def destroy
    @reply.destroy
    redirect_to request.referer
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end

  def ensure_correct_user
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.find(params[:id])
    unless @reply.user == current_user
      redirect_to root_path
    end
  end
end
