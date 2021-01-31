class Professional < ApplicationRecord
  belongs_to :user
  validates :full_name, :role, :details, :photo, :email, presence: true
  validates :details, length: { minimum: 3 }

  has_one_attached :photo, dependent: :destroy

  validate :check_record, on: :create #please not that validate in this case is singular

  def check_record
    if Professional.all.count === 1
      errors[:base] << "You can only have one Professional profile"
    end
  end
end
