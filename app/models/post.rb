class Post < ApplicationRecord
  belongs_to :user
  has_many :post_replies, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :comment, length: { minimum: 3 }
  validates_associated :post_replies
end
