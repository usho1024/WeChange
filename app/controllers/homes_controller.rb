class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @tweets = current_user.tweets
    @user = current_user
    @tweet = Tweet.new
  end

end