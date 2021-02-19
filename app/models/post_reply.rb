class PostReply < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one_attached :photo, dependent: :destroy

  validates_associated :post
  validates :comment, length: { minimum: 3, too_short: '%{count} characters is the minimum allowed' }
end
