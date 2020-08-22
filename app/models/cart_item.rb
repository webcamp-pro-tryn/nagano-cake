class CartItem < ApplicationRecord
  belongs_to :item,dependent: :destroy
  belongs_to :customer

  def total_price
		(quantity * item.price * 1.1).floor.round
	end
end
