class AddIntroToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :intro, :text
  end
end
