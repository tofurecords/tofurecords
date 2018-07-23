class ChangeStatusToBought < ActiveRecord::Migration[5.2]
  def up
    change_column :Boughts, :status, :integer, default: 0
  end

  #変更前の型
  def down
    change_column :Boughts, :status, :string, default: "出荷準備中"
  end
end
