class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many_attached :images
  validates :body, presence: true, length: { maximum: 140 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 部分一致で検索するクラスメソッド
  def self.search_for(content)
    Tweet.where('body LIKE ?', '%' + content + '%')
  end
end
