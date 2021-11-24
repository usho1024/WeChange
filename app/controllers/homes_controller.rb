class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    # whereメソッドでログインユーザーとそのフォローしているユーザーのつぶやきをタイムラインに表示する
    # "*"は可変長引数で、複数の引数（フォローしているユーザーID）を設定することができる
    @tweets = Tweet.where(user_id: [current_user.id, *current_user.following_ids])
    @current_user = current_user
    @tweet_new = Tweet.new
  end
end