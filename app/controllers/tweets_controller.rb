class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path
    else
      @tweets = current_user.tweets
      @user = current_user
      @tweet = Tweet.new
      render 'homes/top'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to user_path(current_user)
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