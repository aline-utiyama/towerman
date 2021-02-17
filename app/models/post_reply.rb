class PostReply < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one_attached :photo, dependent: :destroy

  validates :comment, presence: true
end
