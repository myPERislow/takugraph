class RenamePriorityColumnToSchedules < ActiveRecord::Migration[5.1]
  def change
    rename_column :schedules, :priority, :status
  end
end
