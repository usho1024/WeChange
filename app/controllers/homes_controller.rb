class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    # whereメソッドでログインユーザーとそのフォローしているユーザーのつぶやきを取得する
    # "*"は可変長引数で、複数の引数（フォローしているユーザーID）を設定することができる
    # reverse_orderメソッドで新しい順にレコードを取得する
    @tweets = Tweet.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).reverse_order
    @current_user = current_user
    @tweet_new = Tweet.new
  end
end