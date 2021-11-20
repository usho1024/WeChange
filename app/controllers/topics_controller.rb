class TopicsController < ApplicationController
  before_action :authenticate_user!

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new
    @current_user = current_user
    @tweet_new = Tweet.new
  end

  def index
    @topics = Topic.all
    @current_user = current_user
    @tweet_new = Tweet.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
