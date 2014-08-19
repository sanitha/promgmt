class CreateEnquiries < ActiveRecord::Migration
  def self.up
    create_table :enquiries do |t|
      t.references :user
      t.string :proj_name
      t.string :category
      t.string :frontend
      t.string :backend
      t.text :details
      t.integer :cost
      t.string :duration
      t.date :todays_date
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :enquiries
  end
end
