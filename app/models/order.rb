class Order < ApplicationRecord
	#has_many :cart_items, dependent: :destroy
	belongs_to :customer
	

	# 受注ステータス
	enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
	# 支払い方法
	enum payment: [:クレジットカード, :銀行振込]
end
