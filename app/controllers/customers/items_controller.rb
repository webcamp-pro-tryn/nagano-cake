class Customers::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.where(is_active: true)
    @items_all = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_active: true)
  end


	def genre_items
    @items = Item.where(genre_id: params[:id],is_active: true)
    @genres = Genre.where(is_active: true)
	end

	private
	def item_params
		params.require(:item).permit(:name, :image, :description, :genre_id, :non_tax_price, :is_active)
	end
end
