class SalonInformation < ApplicationRecord
  belongs_to :owner


  validates :salon_id, uniqueness: true
  validates :salon_name, presence: true

end
