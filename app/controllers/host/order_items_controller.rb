class Host::OrderItemsController < ApplicationController
	before_action :authenticate_admin!
  def update
  	@order_item = OrderItem.find(params[:id])
  	@order_items = OrderItem.where(order_id: @order_item.order_id)
  	@order_item.update(order_item_params)
  	flash[:notice] = "ステータスが更新されました。"
  	redirect_to host_order_path(@order_item.order)
  end

  private
  def order_item_params
  	params.require(:order_item).permit(:production_status)


  end
end
