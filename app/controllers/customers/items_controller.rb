class Customers::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

	def genre_items
    @items = Item.where(genre_id: params[:id])
    @genres = Genre.all
	end
	
	private
	def item_params
		params.require(:item).permit(:name, :image, :description, :genre_id, :non_tax_price, :is_active)
	end

end
