class AddCatchCopyToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :CatchCopy, :text
  end
end
