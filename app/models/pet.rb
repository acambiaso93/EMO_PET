class Pet < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_and_breed_and_description,
  against: [ :name, :breed, :description ],
  using: {
    tsearch: { prefix: true }
  }

  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, :breed, :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
