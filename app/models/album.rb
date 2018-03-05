class Album < ApplicationRecord

  mount_uploaders :photographs, PhotoUploader

  belongs_to :order, inverse_of: :album

  validate :number_of_photos_are_enough

  def number_of_photos_are_enough
    require = 10
    require += self.order.addtional_plans[0].photo_number
    if photographs.count < require
      errors.add(:photographs, "への納品枚数が足りません。最低#{require}枚必要です。")
    end
  end
end
