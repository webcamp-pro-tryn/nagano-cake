class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.find_by(customer_id: current_user.id)
  end

  private
  def order_params
    params.require(:order).permit(:payment, :name, :postal_code, :address)
  end
end
