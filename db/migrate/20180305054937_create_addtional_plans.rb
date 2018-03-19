class CreateAddtionalPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :addtional_plans,  id: :integer do |t|
      t.boolean :illust
      t.boolean :addtion_photo
      t.integer :photo_number
      t.references :order
      t.timestamps
    end
  end
end
