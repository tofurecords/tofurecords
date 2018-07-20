class Boughtitem < ApplicationRecord
	belongs_to :bought
	belongs_to :cd

	def total_price
		cd.price * quantity
	end
end
