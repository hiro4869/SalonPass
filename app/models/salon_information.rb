class SalonInformation < ApplicationRecord
  validates :salon_id, uniqueness: true
  validates :salon_name, presence: true
end
