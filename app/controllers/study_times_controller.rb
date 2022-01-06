class StudyTimesController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def create
    @user = User.find(params[:user_id])
    @weekly_time = @user.weekly_time
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

  def destroy
    @study_time.destroy
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  private

  def study_time_params
    params.require(:study_time).permit(:time)
  end

  def ensure_correct_user
    @study_time = StudyTime.find(params[:id])
    unless @study_time.user == current_user
      redirect_to root_path
    end
  end
end
