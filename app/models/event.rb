class Event < ApplicationRecord
  belongs_to :user
  has_many :event_atendees, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :title, :date_time, :details, :location, :duration, presence: true
  validates :title, length: { in: 3..25 }
  validates :details, length: { minimum: 5 }
  validates :capacity, numericality: { greater_than_or_equal_to: 0 }

  n = 10
  CAPACITY = (1..n).to_a
end
