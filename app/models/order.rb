class Order < ApplicationRecord
  # first_name属性に値が存在しない場合バリデーションエラーになります
  validates :first_name, presence: true
  # last_name属性に値が存在しない場合バリデーションエラーになります
  validates :last_name, presence: true
  # day属性に値が存在しない場合バリデーションエラーになります
  validates :day, presence: true
  # location属性に値が存在しない場合バリデーションエラーになります
  validates :location, presence: true
  # phone_number属性に値が存在しない場合バリデーションエラーになります
  validates :phone_number, presence: true
  # Railsの慣例では、相手のモデル上の外部キーを保持しているカラム名については、そのモデル名にサフィックス_idを追加した関連付け名が使用されることを前提としている。
  # :foreign_keyオプションを使用すると外部キーの名前を直接してすることができる。
  has_one :album, dependent: :destroy, inverse_of: :order
  belongs_to :area, optional: true

  has_many :addtional_plans
  accepts_nested_attributes_for :addtional_plans

  belongs_to :user, optional: true



end
