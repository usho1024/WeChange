class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments.page(params[:page])
    @comment = Comment.new
  end

  def index
    @current_user = current_user
    if selection = params[:keyword]
      @topics = Topic.sort(selection)
      @topics = Kaminari.paginate_array(@topics).page(params[:page])
    else
      @topics = Topic.page(params[:page]).reverse_order
    end
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topic_path(@topic)
    else
      flash.now[:error] = 'トピックの投稿に失敗しました。'
      render "new"
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, images: [])
  end
end
