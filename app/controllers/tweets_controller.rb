class TweetsController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy]

  def show
    @tweet = Tweet.find(params[:id])
    @replies = @tweet.replies.page(params[:page])
    @tweet_new = Tweet.new
    @reply = Reply.new
    @user = @tweet.user
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to user_tweet_path(current_user, @tweet)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @tweet.destroy
    redirect_to request.referer
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def ensure_correct_user
    @tweet = Tweet.find(params[:id])
    unless @tweet.user == current_user
      redirect_to root_path
    end
  end
end
