class Pet < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, :breed, :description, :image_url, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
