class ConversationMember < ApplicationRecord
  belongs_to :conversation, foregin_key: true
  belongs_to :user, foregin_key: true
end
