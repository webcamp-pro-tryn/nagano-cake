class Host::OrdersController < ApplicationController
	before_action :authenticate_host!

  def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
  end

  def today_index
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
    @orders = @orders.page(params[:page])
  end


  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  end


  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	order = Order.find(params[:id])
  	  order.update(order_params)
      flash[:notice] = "ステータスが更新されました"
    redirect_to host_order_path(order.id)
  end
  
   private
	def order_params
		params.require(:order).permit(
			:customer_id,
			:postage,
			:name,
			:postal_code,
			:price,
			)
	end
end

