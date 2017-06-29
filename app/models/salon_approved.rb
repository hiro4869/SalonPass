class SalonApproved < ApplicationRecord
  # belongs_to :owner
  belongs_to :salon_information, foreign_key: "salon_id", optional: true

end
