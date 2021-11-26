class SearchesController < ApplicationController

  def search
    @current_user = current_user
    @tweet_new = Tweet.new
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @result = User.search_for(@content, @method)
      @records = User.search_for(@content, @method).page(params[:page]).reverse_order
    else
      @result = Tweet.search_for(@content, @method)
      @records = Tweet.search_for(@content, @method).page(params[:page]).reverse_order
    end
  end
end