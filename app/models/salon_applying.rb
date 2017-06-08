class SalonApplying < ApplicationRecord
  # validates :user_id,  uniquness: { scope: [:owner_id] }
  validates :user_id, :uniqueness => { :scope => [:owner_id] }
end
