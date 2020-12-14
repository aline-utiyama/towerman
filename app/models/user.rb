class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :professionals, dependent: :destroy
  has_many :recycles, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :events, through: :event_atendees
end
