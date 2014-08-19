class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :location
      t.string :status
      t.string :type
      t.string :username
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
