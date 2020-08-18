class Host::ItemsController < ApplicationController

	def top
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to host_item_path(@item)
	end

	def index
		@items = Item.all
	end

	def show
	end

	def edit
	end

	def update
		@item.update(item_params)
		redirect_to host_item_path(@item.id)
	end

	private
	def item_params
		params.require(:item).permit(:name, :image, :description, :genre_id, :non_tax_price, :is_active)
	end
end
