class PurchasesController < ApplicationController

  def index
    @orders = OrderNumber.where(user_id: current_user.id)
  end


  def create
    @shopcarts = Shopcart.where(user_id: current_user.id)

    ActiveRecord::Base.transaction do
      #購入番号を取得
      @OrderNumber = OrderNumber.new
      @OrderNumber.user_id = current_user.id
      @OrderNumber.save!

      #ユーザーの最新の購入番号を取得
      @OrderNumberNow = OrderNumber.where(user_id: current_user.id).last

      #注文された商品を１レコードずつ保存
      @shopcarts.each do |item|
        @purchase = Purchase.new
        @purchase.product_id = item.product_id
        @purchase.purchase_num = item.purchase_num
        @purchase.order_number_id = @OrderNumberNow.id
        @purchase.save!
      end
      @shopcarts.delete_all
    end
    redirect_to user_path(current_user.id)
  end

end
