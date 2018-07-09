class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :image_id
      t.string :label
      t.text :hp
      t.string :twitter
      t.integer :proceed
      t.boolean :recommend

      t.timestamps
    end
  end
end
