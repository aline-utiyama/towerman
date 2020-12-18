class Recycle < ApplicationRecord
  belongs_to :user

  validates :title, :details, :status, :image, presence: true
  validates :details, length: { minimum: 5 }
end
