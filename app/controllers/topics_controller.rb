class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments.page(params[:page])
    @comment = Comment.new
    @current_user = current_user
    @tweet_new = Tweet.new
  end

  def index
    @topics = Topic.all.page(params[:page]).reverse_order
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
