class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
