class StudyTime < ApplicationRecord
  belongs_to :user
  validates :time, presence: true, length: { maximum: 2 }
end
