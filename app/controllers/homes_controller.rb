class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @tweets = current_user.tweets
    @current_user = current_user
    @tweet_new = Tweet.new
  end
end