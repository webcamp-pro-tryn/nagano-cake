class Customers::ItemsController < ApplicationController

	def index
		@items = Item.all
  end
  
	private
	def item_params
		params.require(:item).permit(:name, :image, :description, :genre_id, :non_tax_price, :is_active)
	end
end
