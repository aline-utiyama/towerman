class PostReply < ApplicationRecord
  belongs_to :post
  has_one_attached :photo, dependent: :destroy

  validates :comment, presence: true
end
