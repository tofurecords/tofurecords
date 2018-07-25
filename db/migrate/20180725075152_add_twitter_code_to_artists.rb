class AddTwitterCodeToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :twitter_code, :text
  end
end
