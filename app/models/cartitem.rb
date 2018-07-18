class Cartitem < ApplicationRecord
	belongs_to :cart, inverse_of: :cartitems
	belongs_to :cd

	def total_price
		cd.price * quantity
	end
end
