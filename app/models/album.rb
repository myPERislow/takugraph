class Album < ApplicationRecord

  mount_uploaders :photographs, PhotoUploader

  belongs_to :order
end
