class CartItem < ApplicationRecord
  belongs_to :item

  def total_price
		(quantity * item.price * 1.1).floor.round
	end
end
