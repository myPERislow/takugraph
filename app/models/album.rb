class Album < ApplicationRecord

  mount_uploaders :photographs, PhotoUploader

  belongs_to :order, inverse_of: :album

  validate :number_of_photos_are_enough

  def number_of_photos_are_enough
    require_photo_number = 10
    require_photo_number += self.order.addtional_plans[0].photo_number
    if photographs.count < require_photo_number
      errors.add(:photographs, "への納品枚数が足りません。最低#{require_photo_number}枚必要です。")
    end
  end
end
