class AddOrderToAddtionalPlans < ActiveRecord::Migration[5.1]
  def change
    add_reference :addtional_plans, :order, foreign_key: true
  end
end
