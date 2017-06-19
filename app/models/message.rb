class Message < ApplicationRecord
	validates :body, presence: true
  has_one :attachment
  belongs_to :conversation
  belongs_to :user

  after_create :broadcast

  private
  def broadcast
  	ActionCable.server.broadcast('message', as_json.merge(action: 'CreateMessage'))
  end
end
