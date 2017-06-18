class Attachment < ApplicationRecord
  ## Associations
  actable as: :attachable

  belongs_to :message, optional: true
end
