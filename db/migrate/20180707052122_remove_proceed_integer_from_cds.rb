class RemoveProceedIntegerFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :proceed_integer, :string
  end
end
