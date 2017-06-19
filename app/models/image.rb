class Image < ApplicationRecord
  ## Associations


  ## Validations
  validates :url, presence: true
end
