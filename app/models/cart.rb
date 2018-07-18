class Cart < ApplicationRecord
	belongs_to :user, optional:true
	has_many :cartitems, dependent: :destroy, inverse_of: :cart
    accepts_nested_attributes_for :cartitems, reject_if: :all_blank, allow_destroy: true

	def add_cd(cd_id)

		current_item = cartitems.find_by_cd_id(cd_id)

		if current_item
			current_item.quantity += 1
		else
			current_item = cartitems.build(cd_id: cd_id)
		end
		current_item

	end

	def total_price
		cartitems.to_a.sum { |item| item.total_price }
	end

end