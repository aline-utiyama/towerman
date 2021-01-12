class Professional < ApplicationRecord
  belongs_to :user
  validates :full_name, :role, :details, presence: true
  validates :details, length: { minimum: 3 }
  has_one_attached :photo, dependent: :destroy
end
