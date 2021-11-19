class StudyTimesController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:user_id])
		@study_time = StudyTime.new(study_time_params)
		@study_time.user_id = @user.id
		@study_time.user_id = current_user.id
		if @study_time.save
  		redirect_to user_path(@user.id)
		else
		  render 'users/show'
		end
	end

	private
	def study_time_params
		params.require(:study_time).permit(:time)
	end
end
