class ShopcartsController < ApplicationController

  def index
    @shopcart = Shopcart.where(user_id: params[:user_id])
  end

  def create
    @shopcart = Shopcart.new(shopcart_params)
    @shopcart.user_id = params[:user_id]
    if @shopcart.save
      redirect_to user_path(params[:user_id])
    else
      render 'products/show'
    end
  end

  def destroy
    @shopcart = Shopcart.find(params[:id])
    @shopcart.destroy
    redirect_to user_shopcarts_path(params[:user_id]) 
  end

  private

  def shopcart_params
    params.require(:shopcart).permit(:purchase_num, :product_id)
  end

end
