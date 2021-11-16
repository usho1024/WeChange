class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @user = current_user
    @tweet = Tweet.new
  end

end