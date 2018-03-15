class Area < ApplicationRecord
  validates :prefecture, presence: true
  has_many :orders
  has_many :users
end
