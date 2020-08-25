class Delivery < ApplicationRecord
	belongs_to :customer
	def view_register_address
		self.postal_code + " " + self.address + ' ' + self.name
	end

end
