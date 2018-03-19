class ChangeDatatypeTargetDayOfSchedules < ActiveRecord::Migration[5.1]
  def change
    change_column :schedules, :target_day, :datetime
  end
end
