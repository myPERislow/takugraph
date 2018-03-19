class ChangeDatatypeOrderIdOfAlbums < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :order_id, :integer
  end
end
