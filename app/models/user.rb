class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :topics
  has_many :comments
  has_many :study_times
  attachment :image, destroy: false

  validates :name, length: { minimum: 1, maximum: 10 }, uniqueness: true
  validates :introduction, length: { maximum: 200 }

  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
# 直近一週間の勉強時間の合計を取得するインスタンスメソッド
  def weekly_time
    #まず空の配列を用意する
    array = []
    #study_timeテーブルから最新レコードを7つ取得し、timeカラムのデータを配列に入れる
    study_times.last(7).each do |study_time|
      array << study_time.time
    end
    #sumメソッドで合計値を算出する
    array.sum
  end

# ユーザーを検索するクラスメソッド
  def self.search_for(content, method)
    #完全一致
    if method == 'perfect'
      User.where(name: content)
    #前方一致
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    #後方一致
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
    #部分一致
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
end