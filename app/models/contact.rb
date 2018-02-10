class Contact < ApplicationRecord
  validates :name, presence: true,
            length: { minimum: 3 }
  mount_uploader :photo, PhotoUploader
end
