class Image < ApplicationRecord
  acts_as :attachment

  validates :url, presence: true
end
