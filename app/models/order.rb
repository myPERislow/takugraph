class Order < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :day, presence: true
  validates :location, presence: true
  validates :phone_number, presence: true
  # Railsの慣例では、相手のモデル上の外部キーを保持しているカラム名については、そのモデル名にサフィックス_idを追加した関連付け名が使用されることを前提としている。
  # :foreign_keyオプションを使用すると外部キーの名前を直接してすることができる。
  has_one :album, dependent: :destroy
end
