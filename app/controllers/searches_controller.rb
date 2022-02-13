class SearchesController < ApplicationController
  def search
    @tweet_new = Tweet.new
    @model = params[:model]
    @content = params[:content]
    if @model == 'user'
      @result = User.search_for(@content)
      @records = User.search_for(@content).page(params[:page]).reverse_order
    else
      @result = Tweet.search_for(@content)
      @records = Tweet.search_for(@content).page(params[:page]).reverse_order
    end
  end
end
