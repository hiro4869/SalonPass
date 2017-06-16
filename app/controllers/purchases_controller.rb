class PurchasesController < ApplicationController

  def create
    @shopcarts = Shopcart.where(user_id: current_user.id)

    @shopcarts.each do |item|
      @purchase = Purchase.new
      @purchase.user_id = item.user_id
      @purchase.product_id = item.product_id
      @purchase.purchase_num = item.purchase_num
      @purchase.save
    end
    @shopcarts.delete_all
    redirect_to user_path(current_user.id)
  end

end
