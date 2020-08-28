class OrderItem < ApplicationRecord
  validates :production_status, presence: true
  validates :quantity, presence: true
  belongs_to :item
  belongs_to :order
  enum production_status: { no_avalable: 0, waiting: 1, maiking: 2, complate: 3 }, _prefix: true
end
