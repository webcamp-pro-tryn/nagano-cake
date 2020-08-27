class Order < ApplicationRecord
  with_options presence: true do
    validates :postage
    validates :name
    validates :postal_code
    validates :address
    validates :payment
    validates :order_status
    validates :price
  end

  has_many :order_items, dependent: :destroy
  belongs_to :customer
  enum payment: { "クレジットカード": 0, "銀行振り込み": 1 }, _prefix: true
  enum order_status: { waiting: 0, check: 1, maiking: 2, preparation: 3, complete: 4 }, _prefix: true
end
