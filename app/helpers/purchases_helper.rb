module PurchasesHelper

  def order_total(order)
    total = 0
    order.purchases.each do |item|
      total += item.subtotal
    end
    return total
  end

end
