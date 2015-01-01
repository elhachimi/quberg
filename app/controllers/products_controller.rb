class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      flash[:success] = "Product saved"
      redirect_to root_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:success] = "Product updated successfully"
      redirect_to root_path
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      flash[:success] = "Product deleted successfully"
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:sku, :name, :price, :quantity)
  end
  
end