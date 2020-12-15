class Event < ApplicationRecord
  belongs_to :user
  has_many :event_atendees, dependent: :destroy
  validates :title, :date_time, :details, presence: true
  validates :title, length: { in: 3..50 }
  validates :details, length: { minimum: 5 }
end
