class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :team
      t.references :enquiry
      t.string :proj_name
      t.string :duration
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
