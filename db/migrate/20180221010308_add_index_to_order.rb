class AddIndexToOrder < ActiveRecord::Migration[5.1]
  def change
    #indexの追加
    #add_index :対象のテーブル名、インデックス対象のカラム名
    add_index :orders, :first_name
    add_index :orders, :last_name
    add_index :orders, :day
    add_index :orders, :location
    add_index :orders, :phone_number
   #オプション
   #1.別名をつける
   #add_index :対象のテーブル名、インデックス対象のカラム名、:name インデックスの別名
   #2.インデックスの削除(remove_index)
   #remove_index :対象のテーブル名、インデックス名
  end
end
