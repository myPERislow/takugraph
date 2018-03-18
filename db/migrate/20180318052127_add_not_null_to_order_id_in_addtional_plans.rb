class AddNotNullToOrderIdInAddtionalPlans < ActiveRecord::Migration[5.1]
  def change
    change_column :addtional_plans, :order_id, :integer, null: false
  end
end
