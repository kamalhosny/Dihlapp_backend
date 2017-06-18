class Attachment < ApplicationRecord
  actable
  belongs_to :message, optional: true
end
