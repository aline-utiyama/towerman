class EventAtendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :people, presence: true
  validates :people, numericality: { greater_than_or_equal_to: 1 }


end
