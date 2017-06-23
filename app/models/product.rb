class Product < ApplicationRecord
  has_many :shopcarts  

  validates :product_name, presence: true
  validates :price, presence: true

end
