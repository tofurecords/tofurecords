class CreateBoughtitems < ActiveRecord::Migration[5.2]
  def change
    create_table :boughtitems do |t|
      t.integer :cd_id
      t.integer :quantity
      t.integer :subtotal
      t.integer :bought_id

      t.timestamps
    end
  end
end
