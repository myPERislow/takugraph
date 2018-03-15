class CreateAddtionalPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :addtional_plans,  id: :integer do |t|
      t.integer :order_id
      t.boolean :illust
      t.boolean :addtion_photo
      t.integer :photo_number

      t.timestamps
    end
  end
end
