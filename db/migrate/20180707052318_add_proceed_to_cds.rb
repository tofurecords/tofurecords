class AddProceedToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :proceed, :integer
  end
end
