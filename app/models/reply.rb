class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many_attached :images
  validates :body, presence: true, length: { maximum: 140 }
end
