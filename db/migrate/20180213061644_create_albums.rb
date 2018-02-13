class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :photographs
      t.string :order_id

      t.timestamps
    end
  end
end
