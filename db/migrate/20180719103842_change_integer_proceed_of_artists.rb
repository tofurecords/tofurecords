class ChangeIntegerProceedOfArtists < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :artists, :proceed, 0
  end
end
