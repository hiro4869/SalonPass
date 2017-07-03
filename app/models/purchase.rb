class Purchase < ApplicationRecord
  belongs_to :order_number
  belongs_to :product

  def subtotal
    self.product.price * self.purchase_num
  end


end
