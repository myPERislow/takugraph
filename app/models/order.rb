class Order < ApplicationRecord
  validate :add_error_order
  after_update :send_email_update
  after_save :send_email

  # Railsの慣例では、相手のモデル上の外部キーを保持しているカラム名については、そのモデル名にサフィックス_idを追加した関連付け名が使用されることを前提としている。
  # :foreign_keyオプションを使用すると外部キーの名前を直接してすることができる。
  has_one :album, dependent: :destroy, inverse_of: :order
  belongs_to :area

  has_one :addtional_plans
  accepts_nested_attributes_for :addtional_plans

  belongs_to :user, optional: true

  private

  def send_email
    OrderMailer.post_order(@order).deliver_later
  end

  def send_email_update
    OrderMailer.photographer_post_order(@order).deliver_later
  end

  def add_error_order
    if first_name.blank?
      errors[:base] << "苗字は必ず入力してください"
    end

    if last_name.blank?
      errors[:base] << "名前は必ず入力してください"
    end

    if date.blank?
      errors[:base] << "日程は必ず入力してください"
    end

    if location.blank?
      errors[:base] << "場所を必ず入力してください"
    end

    if phone_number.blank?
      errors[:base] << "電話番号は必ず入力してください"
    end

    if email.blank?
      errors[:base] << "メールアドレスは必ず入力してください"
    end
  end
end
