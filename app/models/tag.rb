class Tag < ApplicationRecord
  has_many :interest_tags
  validates :name, presence: true
end
