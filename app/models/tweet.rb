class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :body, presence: true, length: { maximum: 140 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

# つぶやきの検索方式を判別するクラスメソッド
  def self.search_for(content, method)
    if method == 'perfect'
      Tweet.where(body: content) #完全一致
    elsif method == 'forward'
      Tweet.where('body LIKE ?', content + '%') #前方一致
    elsif method == 'backward'
      Tweet.where('body LIKE ?', '%' + content) #後方一致
    else
      Tweet.where('body LIKE ?', '%' + content + '%') #部分一致
    end
  end
end
