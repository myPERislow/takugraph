class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  validate :add_error_order
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: {admin: 1, photographer: 2, member: 3 }

  has_many :schedules
  has_many :orders, dependent: :destroy
  belongs_to :area, optional: true

  # Scope
  scope :admin, -> { where(role: 1)}
  scope :photographer, -> { where(role: 2)}
  scope :member, -> { where(role: 3)}
  scope :search_area, ->(area){ where(area_id: area )}
  # あとで、orders_controller.rb(本当はserviceディレクトリの中のAutomatingのところにあるやつ)で、
  #.where(area_id: @area.id)を.search_area(@area.id)に書き換えたら、
  # このコメントは削除する

  # accepts_nested_attributes_forは、親子関係のある関連モデル(Project has_many :tasks や Enquate has_many :questionsなど)で、親から子を作成したり保存したりする時に使える。。
  accepts_nested_attributes_for :schedules


  private

  def add_error_order
    if email.blank?
      errors[:base] << "emailは必ず入力してください"
    end
  end
end
