class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :team_ID
      t.string :team_lead_ID
      t.integer :no_of_emp
      t.text :emp_IDs
      t.string :status
      t.string :proj_name
      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
