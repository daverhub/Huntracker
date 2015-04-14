class AddTrackeridToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :tracker_id, :integer
  end
end
