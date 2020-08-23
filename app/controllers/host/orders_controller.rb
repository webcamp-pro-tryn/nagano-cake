class Host::OrdersController < ApplicationController
	before_action :authenticate_host!
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
  	@order = Order.find(params[:id])
  	  @order.update(order_params)
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

