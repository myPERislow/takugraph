class Album < ApplicationRecord

  mount_uploaders :photographs, PhotoUploader

  belongs_to :order

  validate :number_of_photos_are_enough

  def number_of_photos_are_enough
    require = 10
    if photographs.count < 10
      errors.add(:photographs, "への納品枚数が足りません。最低#{require}枚必要です。")
    end
  end
end
