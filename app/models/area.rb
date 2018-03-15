class Area < ApplicationRecord
  validate :add_error_order
  has_many :orders
  has_many :users

  private
  def add_error_order
    if prefecture.blank?
      errors[:base] << "地域は必ず入力してください"
    end
  end
end
