class HomesController < ApplicationController

	def top
		@items = Item.order("RANDOM()").limit(4)
		@genres = Genre.all
	end

	def about
	end
end
