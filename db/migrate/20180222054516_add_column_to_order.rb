class AddColumnToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :area_id, :integer
  end
end
