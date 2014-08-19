class Addcolumn < ActiveRecord::Migration
  def self.up
    add_column :employees, :email, :string
  end

  def self.down
  end
end
