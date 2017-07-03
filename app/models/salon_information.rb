class SalonInformation < ApplicationRecord
  self.primary_key = "salon_id"
  mount_uploader :image, ImageUploader

  belongs_to :owner ,optional: true
  has_many :salon_approveds


  belongs_to :salon_applying, foreign_key: "salon_id", optional: true

  validates :salon_id, uniqueness: true
  validates :salon_name, presence: true

end
