class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post_comments
  # belongs_to :salon_approved, optional: true

  def owner_of?(comment)
    self.id == comment.user_id
  end

end
