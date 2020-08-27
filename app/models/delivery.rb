class Delivery < ApplicationRecord
	with_options presence: true do
		validates :name
		validates :address
		validates :postal_code
	end


	belongs_to :customer

	# 登録配送先の表示用メソッド
	def view_register_address
		self.postal_code + " " + self.address + ' ' + self.name
	end

end
