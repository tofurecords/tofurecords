class CreateBoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :boughts do |t|
      t.integer :user_id
      t.string :status
      t.string :name
      t.string :post
      t.string :address
      t.string :tel
      t.string :kana

      t.timestamps
    end
  end
end
