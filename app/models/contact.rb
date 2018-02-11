class Contact < ApplicationRecord
  validates :name, presence: true,
            length: { minimum: 3, maximum: 255 }

  validates :phone, numericality: true,
            length: { maximum: 30 },
            allow_blank: true

  validates :email,
            :email_format => { :message => 'invalid email address' },
            length: { maximum: 255 },
            allow_blank: true

  mount_uploader :photo, PhotoUploader
end
