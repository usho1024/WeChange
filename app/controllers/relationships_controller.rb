class RelationshipsController < ApplicationController
  before_action :authenticate_user!
 
	def create
		current_user.follow(params[:user_id])
		redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:user_id])
		redirect_to request.referer
	end

  def followings
		@user = User.find(params[:user_id])
		@users = @user.followings
    @current_user = current_user
    @tweet_new = Tweet.new
  end

  def followers
		@user = User.find(params[:user_id])
		@users = @user.followers
    @current_user = current_user
    @tweet_new = Tweet.new
  end
end
