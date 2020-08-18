class Customers::CartItemsController < ApplicationController
  def index
  end

  def create
    @cart_item = CartItem.create(cart_item_params)
    redirect_to customers_cart_items_path
  end

  def show
  end

  def destroy_all
  end
  
  private
	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end
end
