class ChangeArtistIdToFavorite < ActiveRecord::Migration[5.2]
  def up
  	change_column :Favorites, :artist_id, :integer, :unique => true
  end

  def down
  	change_column :Favorites, :artist_id, :integer
  end
end
