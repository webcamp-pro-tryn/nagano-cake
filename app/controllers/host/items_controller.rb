class Host::ItemsController < ApplicationController
	before_action :authenticate_host!

	before_action :set_genres, only: [:new, :edit, :index, :create, :update]

	def top
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to host_item_path(@item.id)
		else
			render :new
		end
	end

	def index
		@items = Item.all.page(params[:page])
		@search = Item.ransack(params[:q])
		@items = @search.result.page(params[:page])
	end

	def show
		@item = Item.find_by(id: params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to host_item_path(@item.id)
	end

	private
	def item_params
		params.require(:item).permit(:name, :image, :description, :genre_id, :non_tax_price, :is_active)
	end

	def set_genres
		@genres = Genre.where(is_active: true)
	end

end
