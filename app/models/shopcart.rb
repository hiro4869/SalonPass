class Shopcart < ApplicationRecord
  belongs_to :product
  validates :purchase_num, presence: true


  def subtotal
    self.product.price * self.purchase_num
  end

  def new_purchase
  end
  # def total
  #     total = 0
  #   self.each do |item|
  #     total += item.subtotal
  #   end
  # end

end
