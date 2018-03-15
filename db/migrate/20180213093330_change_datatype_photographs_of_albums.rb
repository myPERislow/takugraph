class ChangeDatatypePhotographsOfAlbums < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :photographs , :json
  end
end
