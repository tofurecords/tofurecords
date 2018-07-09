class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :name
      t.integer :disc_id
      t.integer :order

      t.timestamps
    end
  end
end
