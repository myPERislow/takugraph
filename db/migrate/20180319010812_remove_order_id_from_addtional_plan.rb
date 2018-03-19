class RemoveOrderIdFromAddtionalPlan < ActiveRecord::Migration[5.1]
  def up
    remove_column :addtional_plans, :order_id, :integer
  end

  def down
    add_column :addtional_plans, :order_id, :integer
  end
end
