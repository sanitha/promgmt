class Removecolumn < ActiveRecord::Migration
  def self.up
    rename_column :users, :type, :version
  end

  def self.down
  end
end
