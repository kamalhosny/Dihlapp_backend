class ConversationMember < ApplicationRecord
  belongs_to :conversation, foreign_key: true
  belongs_to :user, foreign_key: true
end
