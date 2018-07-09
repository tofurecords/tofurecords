class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.text :artist_name
      t.text :song_name
      t.text :url

      t.timestamps
    end
  end
end
