class Professional < ApplicationRecord
  belongs_to :user
  validates :full_name, :role, :details, :price, presence: true
  validates :details, lenght: { minimum: 3 }
end
