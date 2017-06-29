class SalonApplying < ApplicationRecord
  belongs_to :salon_information, foreign_key: "salon_id", optional: true

  validates :user_id, :uniqueness => { :scope => [:salon_id] }
end
