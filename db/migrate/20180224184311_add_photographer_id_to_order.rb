class AddPhotographerIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :photographer_id, :integer
  end
end
