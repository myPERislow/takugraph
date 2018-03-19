class RenameDayColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :day, :date
  end
end
