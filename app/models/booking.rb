class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  has_one :review, dependent: :destroy
end
