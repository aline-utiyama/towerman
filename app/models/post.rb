class Post < ApplicationRecord
  belongs_to :user
  has_many :post_replies
  has_one_attached :photo, dependent: :destroy

  validates :comment, length: { minimum: 3 }
end
