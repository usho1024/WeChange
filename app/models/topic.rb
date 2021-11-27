class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }

  # トピックの並び順をソートするクラスメソッド
  def self.sort(selection)
    if selection == 'new'
      Topic.order(created_at: :DESC) #作成日が新しい順
    elsif selection == 'old'
      Topic.order(created_at: :ASC) #作成日が古い順
    elsif selection == 'many'
      Topic.find(Comment.group(:topic_id).order(Arel.sql('count(topic_id) desc')).pluck(:topic_id)) #コメントが多い順
    else
      Topic.find(Comment.group(:topic_id).order(Arel.sql('count(topic_id) asc')).pluck(:topic_id)) #コメントが少ない順
    end
  end
end