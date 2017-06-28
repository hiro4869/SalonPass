class SalonApplying < ApplicationRecord
  validates :user_id, :uniqueness => { :scope => [:salon_id] }
end
