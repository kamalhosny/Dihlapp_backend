class Message < ApplicationRecord
	validates :body, presence: true
  has_one :attachment
  belongs_to :conversation
  belongs_to :user
end
