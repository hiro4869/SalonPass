class SalonInformation < ApplicationRecord
  belongs_to :owner ,optional: true
  belongs_to :salon_approved, foreign_key: "salon_id", optional: true
  belongs_to :salon_applying, foreign_key: "salon_id", optional: true

  validates :salon_id, uniqueness: true
  validates :salon_name, presence: true

end
