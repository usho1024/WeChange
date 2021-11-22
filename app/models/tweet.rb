class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :body, presence: true, length: { maximum: 140 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

# つぶやきを検索するクラスメソッド
  def self.search_for(content, method)
    #完全一致
    if method == 'perfect'
      Tweet.where(body: content)
    #前方一致
    elsif method == 'forward'
      Tweet.where('body LIKE ?', content + '%')
    #後方一致
    elsif method == 'backward'
      Tweet.where('body LIKE ?', '%' + content)
    else
    #部分一致
      Tweet.where('body LIKE ?', '%' + content + '%')
    end
  end
end
