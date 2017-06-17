class MessagesController < ApplicationController
	before_action :find_conversation!

	def new
		@message = current_user.messages.build
	end

	def create
		@conversation ||= Conversation.create(sender_id: current_user.id, receiver_id: @receiver.id)
		@message = current_user.messages.build(message_params)
		@message.conversation_id = @conversation.id
		if @message.save!
			format.json { render json: @message }
		else
			format.json { render json: @message.errors.full_messages, status: :bad_request }
		end
	end

	private

	def message_params
		params.require(:message).permit(:body)
	end

	def find_conversation!
		@conversation = Conversation.find_by(id: params[:conversation_id])
	end
end
