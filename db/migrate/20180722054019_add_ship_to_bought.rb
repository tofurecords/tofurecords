class AddShipToBought < ActiveRecord::Migration[5.2]
  def change
    add_column :boughts, :ship, :integer
  end
end
