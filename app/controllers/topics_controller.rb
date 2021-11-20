class TopicsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @topics = Topic.all
    @current_user = current_user
    @tweet_new = Tweet.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
