class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @tweets = Tweet.all
    @current_user = current_user
    @tweet_new = Tweet.new
  end
end