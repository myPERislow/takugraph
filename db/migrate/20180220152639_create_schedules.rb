class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules, id: :integer  do |t|
      t.integer :user_id
      t.date :target_day
      t.boolean :priority
      t.timestamps
    end
    # add_foreign_key :schedules , :users
  end
end
