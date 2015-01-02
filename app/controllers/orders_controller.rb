class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @products = products
  end

  def create
    # total = order_total
    order = Order.new(order_params)
    order.total = order_total
    if order.save
      flash[:success] = "Product successfully saved"
      redirect_to orders_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:order_number, order_lines_attributes: [:id, :quantity, :product_id, :unit_price, :_destroy])
  end
  
  def products
    @_products ||= Product.all.collect {|p| [ p.name, p.id ] }
  end

  def order_total
    total = 0
    params[:order][:order_lines_attributes].each do |key, value|
      total += value[:unit_price].to_i * value[:quantity].to_i
    end
    total
  end
  
end