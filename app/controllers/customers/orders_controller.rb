class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = current_customer.deliveries.all
  end

  def index
    @orders = Order.all
    
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    if params[:address] == "my_address"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.save
    elsif params[:address] == "select_address"
      byebug

    end
    @cart_items = current_customer.cart_items.all

  # 注文が確定したらCartItemの情報をOrderItemに入れる
    @cart_items.each do |cart_item|
    @order_item = @order.order_items.new
      @order_item.item_id = cart_item.item.id
      @order_item.quantity = cart_item.quantity
      @order_item.sub_price = cart_item.item.non_tax_price
      @order_item.save
    end

      

    redirect_to  confirm_customers_order_path(@order)
  end

  def confirm
    @order_items = OrderItem.where(order_id: params[:id])
    @order = Order.find_by(id: params[:id]) 
   end

  def thanks
    # 注文が確定したらCartItemの情報を削除
    current_customer.cart_items.destroy_all
  end

  private
  def order_params
    params.require(:order).permit(:payment, :name, :postal_code, :address)
  end
end
