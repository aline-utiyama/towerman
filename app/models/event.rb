class Event < ApplicationRecord
  belongs_to :user
  has_many :event_atendees, dependent: :destroy
end
