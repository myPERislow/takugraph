class RemoveOrderIdFromAlbums < ActiveRecord::Migration[5.1]
  def up
    remove_column :albums, :order_id, :integer
  end

  def down
    add_column :albums, :order_id, :integer
  end
end
