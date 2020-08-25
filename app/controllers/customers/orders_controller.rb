class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = current_customer.deliveries.all
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def create
    @order = current_customer.orders.new(order_params)
    # ご自身の住所
    if params[:address] == "my_address"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    # 登録済住所
    elsif params[:address] == "select_address"
      address = Delivery.find(params[:order][:id])
      @order.name = address.name
      @order.postal_code = address.postal_code
      @order.address = address.address
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

    # 商品の合計金額をorder.priceに入れる
    items = @order.order_items
    @order.price = 0
    items.each do |item|
      @order.price += (item.sub_price * 1.1).floor * item.quantity
    end

    if @order.save
      redirect_to  confirm_customers_order_path(@order)
    else
      render 'new'
    end
  end

  def confirm
    @order_items = OrderItem.where(order_id: params[:id])
    @order = Order.find_by(id: params[:id]) 
   end

  def thanks
    @order = current_customer.orders.last
    @orders = current_customer.orders.all
    # 注文が確定したらCartItemの情報を削除
    current_customer.cart_items.destroy_all
  end

  def add_delivery
    @order = current_customer.orders.last
    @delivery = current_customer.deliveries.new
    @delivery.name = @order.name
    @delivery.postal_code = @order.postal_code
    @delivery.address = @order.address
    @delivery.save
    redirect_to customer_deliveries_path(current_customer)
  end

  private
  def order_params
    params.require(:order).permit(:payment, :name, :postal_code, :address)
  end

end
