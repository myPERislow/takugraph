class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :integer do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :day
      t.string :location
      t.string :phone_number
      t.text :comment

      t.timestamps
    end
  end
end
