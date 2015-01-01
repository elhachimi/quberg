class OrdersController < ApplicationController

  def index
    @orders = []
  end

  def new
    @order = Order.new
  end
  
end