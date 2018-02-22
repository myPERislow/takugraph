class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: {admin: 1, photographer: 2, member: 3 }

  has_many :schedules
  # accepts_nested_attributes_forは、親子関係のある関連モデル(Project has_many :tasks や Enquate has_many :questionsなど)で、親から子を作成したり保存したりする時に使える。。
  accepts_nested_attributes_for :schedules
end
