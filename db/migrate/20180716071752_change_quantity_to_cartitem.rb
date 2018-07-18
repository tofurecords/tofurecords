class ChangeQuantityToCartitem < ActiveRecord::Migration[5.2]
  def up
    change_column :Cartitems, :quantity, :integer, default: 1
  end

  #変更前の型
  def down
    change_column :Cartitems, :quantity, :integer
  end
end
