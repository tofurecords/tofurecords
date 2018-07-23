class ChangeShipToBought < ActiveRecord::Migration[5.2]
  def up
    change_column :Boughts, :ship, :integer, default: 0
  end

  #変更前の型
  def down
    change_column :Boughts, :ship, :integer
  end
end
