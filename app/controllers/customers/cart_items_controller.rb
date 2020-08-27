class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all

    # 個数選択されていない時
    if @cart_item.quantity.nil?
      flash[:notice] = "個数を選択してください"
      redirect_to request.referrer
    else
      # 個数選択されている かつ カート内に既に同じ商品がある時
      @cart_items.each do |cart_item|
        if cart_item.item.name == @cart_item.item.name
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update_attribute(:quantity, new_quantity)
          @cart_item.delete
        end
      end
      # 個数選択されている かつ カート内に既に同じ商品がない時
      @cart_item.save
      redirect_to customers_cart_items_path
    end
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
