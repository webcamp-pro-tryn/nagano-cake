class OrderItem < ApplicationRecord
  belongs_to :item,dependent: :destroy
  belongs_to :order
end
