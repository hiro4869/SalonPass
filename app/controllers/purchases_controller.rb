class PurchasesController < ApplicationController

  def index
    @orders = OrderNumber.where(user_id: current_user.id)
  end


  def create
    @shopcarts = Shopcart.where(user_id: current_user.id)

    @OrderNumber = OrderNumber.new
    @OrderNumber.user_id = current_user.id
    @OrderNumber.save

    @OrderNumberNow = OrderNumber.where(user_id: current_user.id).last

    @shopcarts.each do |item|
      @purchase = Purchase.new
      @purchase.product_id = item.product_id
      @purchase.purchase_num = item.purchase_num
      @purchase.ordernumber_id = @OrderNumberNow.id
      @purchase.save
    end
    @shopcarts.delete_all
    redirect_to user_path(current_user.id)
  end

end
