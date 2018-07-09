class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :title
      t.text :image_id
      t.integer :price
      t.integer :genre
      t.integer :stock
      t.integer :release
      t.integer :artist_id
      t.string :proceed_integer

      t.timestamps
    end
  end
end
