class StudyTimesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@user = User.find(params[:user_id])
		@tweets = current_user.tweets.page(params[:page]).reverse_order
    @current_user = current_user
    @tweet_new = Tweet.new
		@study_time = StudyTime.new(study_time_params)
		@study_time.user_id = current_user.id
		if @study_time.save
	  	redirect_to user_path(current_user)
		else
		  render 'users/show'
		end
	end
	
	private

	def study_time_params
		params.require(:study_time).permit(:time)
	end
end
