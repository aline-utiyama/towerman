class EventAtendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :people, presence: true
end
