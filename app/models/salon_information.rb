class SalonInformation < ApplicationRecord
  validates :salon_id, uniqueness: true
end
