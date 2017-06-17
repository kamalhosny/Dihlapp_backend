require 'rails_helper'

RSpec.describe Conversation, type: :model do
  conversation = Conversation.new

  it "should exist only if it contains messages" do
    expect(conversation.messages.count).not_to eql(0)
  end

  it "should always have a sender id" do
    expect(conversation.sender_id).not_to eqp(nil)
  end

  it "should be only between two different user_ids" do
    expect(conversation.sender_id).not_to eql(conversation.receiver_id)
  end
end
