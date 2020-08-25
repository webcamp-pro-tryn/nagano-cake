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
    @orders = Order.page(params[:page])
    @q = Order.ransack(params[:q])
    if params[:q] != nil
    @orders =@q.result.includes(:customer).page(params[:page]).reverse_order
    else
   @orders = Order.page(params[:page])
  end
end

  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_items.where(params[:id])
  end


  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	  if @order.update(order_params)
      flash[:success] = "ステータスが更新されました"
    redirect_to host_order_path(@order.id)
      else 
        render 'show'
      end
  end
  
   private
	def order_params
		params.require(:order).permit(
			:customer_id,
			:postage,
			:name,
			:postal_code,
			:price,
      :order_status
			)
	end
end

