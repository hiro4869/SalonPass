class ProductsController < ApplicationController

  def index
    @products = Product.where(salon_id: params[:salon_id])
  end

  def owner_index
    @products = Product.where(salon_id: params[:salon_id])
  end

  def show
    @product = Product.find(params[:id])
    @shopcart = Shopcart.new()
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.salon_id = params[:salon_id]
    if @product.save
      redirect_to owner_salon_path(params[:salon_id])
    else
      render 'products/new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to owner_salon_path(params[:salon_id])
    else
      render 'products/edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to owner_salon_path(params[:salon_id]) 
  end

  private

  def product_params
      params.require(:product).permit(:price, :product_name, :description)
  end

end