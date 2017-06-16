class ShopcartAftersController < ApplicationController

  #カートの商品を削除して、「あとで買う」に新規保存する
  def create
    @ShopcartAfter = ShopcartAfter.new(shopcart_after_params)
    @shopcart = Shopcart.where(user_id: params[:shopcart_after][:user_id]).find_by(product_id: params[:shopcart_after][:product_id])
    if @ShopcartAfter.save
      @shopcart.destroy
      redirect_to user_shopcarts_path(params[:user_id])
    else
      render 'shopcarts/index'
    end
  end

  #「あとで買う」の商品を削除して、カートに商品を新規保存する
  def return_cart
    @shopcart = Shopcart.new(shopcart_params)
    @ShopcartAfter = ShopcartAfter.where(user_id: params[:shopcart][:user_id]).find_by(product_id: params[:shopcart][:product_id])
    if @shopcart.save
      @ShopcartAfter.destroy
      redirect_to user_shopcarts_path(params[:user_id])
    else
      render 'shopcarts/index'
    end
  end

  def destroy
    @ShopcartAfter = ShopcartAfter.find(params[:id])
    @ShopcartAfter.destroy
    redirect_to user_shopcarts_path(params[:user_id]) 
  end



  private

  def shopcart_after_params
    params.require(:shopcart_after).permit(:purchase_num, :product_id, :user_id)
  end

  def shopcart_params
    params.require(:shopcart).permit(:purchase_num, :product_id, :user_id)
  end


end
