class AddIntroToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :Intro, :text
  end
end
