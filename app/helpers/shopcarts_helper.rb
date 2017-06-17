module ShopcartsHelper
  def total(shopcarts)
    total = 0
    shopcarts.each do |item|
      total += item.subtotal
    end
    return total
  end
end
