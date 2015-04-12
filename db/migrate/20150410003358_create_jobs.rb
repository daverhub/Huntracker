class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :company, null: false
      t.string :city
      t.string :state
      t.string :country
      t.string :description
      t.string :url
      t.string :job_key
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
