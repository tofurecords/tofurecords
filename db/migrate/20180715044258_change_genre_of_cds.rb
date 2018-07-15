class ChangeGenreOfCds < ActiveRecord::Migration[5.2]
def self.up
  change_column :cds, :genre, :integer, default: 0
end

def self.down
  change_column :cds, :genre, :integer
end
end
