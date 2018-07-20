class ChangeStringStatusOfBoughts < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :boughts, :status, "出荷準備中"
  end
end
