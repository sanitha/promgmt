class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :emp_ID
      t.string :lastname
      t.string :firstname
      t.string :designation
      t.string :qualification
      t.text :skils
      t.string :status
      t.integer :phone
      t.string :sex
      t.text :address
      t.integer :salary
      t.references :project
      t.references :team
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end

