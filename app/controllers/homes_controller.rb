class HomesController < ApplicationController
  def top
    @items = Item.order("RANDOM()").limit(4)
    @genres = Genre.where(is_active: true)
  end

  def about
  end
end
