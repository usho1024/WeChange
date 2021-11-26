class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).reverse_order
    @current_user = current_user
    @tweet_new = Tweet.new
    @study_time = StudyTime.new
    @weekly_time = @user.weekly_time
  end

  def index
    @users = User.weekly_time.page(params[:page])
    @current_user = current_user
    @tweet_new = Tweet.new
    @study_time = StudyTime.new
  end

  def edit
    @user = User.find(params[:id])
    @current_user = current_user
    @tweet_new = Tweet.new
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @current_user = current_user
      @tweet_new = Tweet.new
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
