class CreateCartitems < ActiveRecord::Migration[5.2]
  def change
    create_table :cartitems do |t|
      t.integer :cd_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
