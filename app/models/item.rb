class Item < ApplicationRecord
  validates :name, presence: true
  validates :non_tax_price, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  belongs_to :genre
  has_many :cart_items
  has_many :order_items

  attachment :image
end
