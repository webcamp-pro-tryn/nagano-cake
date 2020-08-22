class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = current_customer.cart_items.create(cart_item_params)
    @cart_items = current_customer.cart_items.all
    
    # カート内に既に同じ商品がある時は数量だけ増やす
    @cart_items.each do |cart_item|
      if cart_item.item.id == @cart_item.item.id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to customers_cart_items_path
  end

  def show
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path
  end

  def update
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customers_cart_items_path
  end


  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to customers_cart_items_path
  end
  
  private
	def cart_item_params
		params.require(:cart_item).permit(:quantity, :item_id)
	end
end
