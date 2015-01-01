class ProductsController < ApplicationController
  def index
    @categories = categories << ["All", 0]
    if params[:category_id] && params[:category_id] != "0"
      @products = Product.find_by(category_id: params[:category_id])
    else
      @products = Product.all
    end
    
    
  end

  def new
    @product = Product.new
    @categories = categories
  end

  def create
    product = Product.new(product_params)
    if product.save
      flash[:success] = "Product saved"
      redirect_to root_path
    else
        flash[:danger] = "tere was an error saving the product"
        redirect_to :back
    end
  end

  def edit
    @product = product
    @categories = categories
  end

  def update
    if product.update(product_params)
      flash[:success] = "Product updated successfully"
      redirect_to root_path
    end
  end

  def destroy
    if product.destroy
      flash[:success] = "Product deleted successfully"
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:sku, :name, :price, :quantity, :category_id)
  end

  def product
    @_product ||= Product.find(params[:id])
    
  end

  def categories
    @_categories ||= Category.all.collect {|p| [ p.title, p.id ] }
  end
  
end