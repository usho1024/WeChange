class HomesController < ApplicationController
  def top
    # whereメソッドでログインユーザーとそのフォローしているユーザーのつぶやきを取得する
    # "*"は可変長引数で、複数の引数（フォローしているユーザーID）を配列として返すことができる
    # reverse_orderメソッドで作成日降順（新着順）に取得つぶやきをソートする
    @tweets = Tweet.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).reverse_order
    @tweet_new = Tweet.new
  end
end
