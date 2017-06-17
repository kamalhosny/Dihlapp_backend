class MessageController < ApplicationController
  def new
  @message = current_user.messages.build
end
def create
  @conversation ||= Conversation.create(sender_id: current_user.id,
                                        receiver_id: @receiver.id)
  @message = current_user.messages.build(message_params)
  @message.conversation_id = @conversation.id
  @message.save!

  flash[:success] = "Your message was sent!"
  redirect_to conversation_path(@conversation)
end
end
