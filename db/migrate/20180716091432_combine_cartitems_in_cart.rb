class CombineCartitemsInCart < ActiveRecord::Migration[5.2]
  def up
	Cart.all.each do |cart|
		sums = cart.cartitems.group(:cd_id).sum(:quantity)

		sums.each do |cd_id, quantity|
			if quantity > 1
				cart.cartitems.where(cd_id: cd_id).delete_all
				cart.cartitems.create(cd_id: cd_id, quantity: quantity)
			end
		end
	end
  end
  def down
	Carttem.where("quantity>1").each do |cartitem|

		cartitem.quantity.times do
			Cartitem.create cart_id: cartitem.cart_id, cd_id: cartitem.cd_id, quantity: 1
		end

		cartitem.destroy
	end
  end
end