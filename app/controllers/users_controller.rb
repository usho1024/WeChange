class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).reverse_order
    @tweet_new = Tweet.new
    @study_time = StudyTime.new
    @last7_time = @user.last7_time
    @total_time = @user.total_time
  end

  def index
    @current_user = current_user
    @tweet_new = Tweet.new
    if @selection = params[:keyword]
      @users = User.sort(@selection)
      @users = Kaminari.paginate_array(@users).page(params[:page])
    else
      @users = User.weekly_time
      @users = Kaminari.paginate_array(@users).page(params[:page])
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = 'プロフィールの編集に失敗しました。'
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
