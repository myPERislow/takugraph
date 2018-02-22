class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :prefecture

      t.timestamps
    end
  end
end
