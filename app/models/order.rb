class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :customer
	enum payment: {credit: 0, cach: 1}, _prefix: true
	enum order_status: {waiting: 0, check: 1, maiking: 2, preparation: 3, complete: 4}, _prefix: true
end
