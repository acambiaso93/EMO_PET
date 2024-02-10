class Pet < ApplicationRecord
  has_many :booking, dependent: :destroy
end
