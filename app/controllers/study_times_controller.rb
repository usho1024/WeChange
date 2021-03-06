class StudyTimesController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy, :edit, :update]

  def create
    @user = User.find(params[:user_id])
    @weekly_time = @user.weekly_time
    @tweets = current_user.tweets.page(params[:page]).reverse_order
    @study_time = StudyTime.new(study_time_params)
    @study_time.user_id = current_user.id
    if @study_time.save
      redirect_to user_path(current_user)
    else
      @user = current_user
      @tweets = @user.tweets.page(params[:page]).reverse_order
      @study_time = StudyTime.new
      @last7_time = @user.last7_time
      @total_time = @user.total_time
      flash.now[:error] = '勉強時間の投稿に失敗しました。'
      render "users/show"
    end
  end

  def destroy
    @study_time.destroy
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
    if @study_time.update(study_time_params)
      redirect_to user_path(current_user)
    else
      flash.now[:error] = '勉強時間の編集に失敗しました。'
      render "edit"
    end
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
