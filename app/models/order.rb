class Order < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :day, presence: true
  validates :location, presence: true
  validates :phone_number, presence: true

  # has_one :album, dependent: :destroy
end
