class Host::OrderItemsController < ApplicationController
  before_action :authenticate_host!
  def update
    @order_items = OrderItem.find(params[:id])
    @order_items.update(order_item_params)
    if flash[:success] = "ステータスが更新されました。"
      redirect_to host_order_path(@order_items.id)
    else
      render 'order/show'
  end
 end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
