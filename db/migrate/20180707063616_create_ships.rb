class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :post
      t.string :address
      t.string :tel
      t.string :kana
      t.integer :user_id

      t.timestamps
    end
  end
end
