class ChangeIntegerProceedOfCds < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :cds, :proceed, 0
  end
end
