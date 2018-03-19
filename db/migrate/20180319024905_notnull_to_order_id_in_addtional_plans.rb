class NotnullToOrderIdInAddtionalPlans < ActiveRecord::Migration[5.1]
  def change
    change_column :addtional_plans, :order_id, :bigint, null: false
  end
end
