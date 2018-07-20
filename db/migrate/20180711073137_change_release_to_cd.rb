class ChangeReleaseToCd < ActiveRecord::Migration[5.2]
  def up
    change_column :Cds, :release, :date
  end


  def down
    change_column :Cds, :release, :intger
  end
end
