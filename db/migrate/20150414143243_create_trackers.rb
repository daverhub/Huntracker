class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.boolean :applied
      t.boolean :followup
      t.boolean :interviewed
      t.text :notes
      t.integer :job_id

      t.timestamps
    end
  end
end
