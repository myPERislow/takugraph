class AddOrderToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :order, foreign_key: true
  end
end
