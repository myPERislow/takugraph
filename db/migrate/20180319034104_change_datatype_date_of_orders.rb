class ChangeDatatypeDateOfOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :date, :datetime
  end
end
