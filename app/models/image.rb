class Image < ApplicationRecord
  ## Associations
  belongs_to :message, optional: true

  ## Validations
  validates :url, presence: true
end
