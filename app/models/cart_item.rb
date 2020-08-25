class CartItem < ApplicationRecord
  validates :quantity, presence: true
  
  belongs_to :item
  belongs_to :customer

  
end
