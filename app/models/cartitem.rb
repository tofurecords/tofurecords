class Cartitem < ApplicationRecord
	belongs_to :cart, optional:true, inverse_of: :cartitems
	belongs_to :cd, optional:true

	def total_price
		cd.price * quantity
	end
end
