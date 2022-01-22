class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many_attached :images
  validates :body, presence: true, length: { maximum: 500 }
end
