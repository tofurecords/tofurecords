class CangeDatatypeReleaseOfCds < ActiveRecord::Migration[5.2]
  def change
  	change_column :cds, :release, :date
  end
end
