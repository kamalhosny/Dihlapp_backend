class Image < ApplicationRecord
  ## Associations
  acts_as :attachment, as: :attachable

  ## Validations
  validates :url, presence: true

  mount_uploader :url, AvatarUploader
end
