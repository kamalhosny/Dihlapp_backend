class MessagesController < ApplicationController
	before_action :find_conversation!


	def index
		# render_api(messages)
		@messages = Message.all
		render json: @messages.to_json
	end

	def new
		@message = current_user.messages.build
	end

	def create
		@conversation ||= Conversation.create!(last_message_id: 1)
		@conversation_member = ConversationMember.where(conversation_id: @conversation.id, user_id:current_user.id)
		@conversation_member ||= ConversationMember.create(conversation: @conversation, user: current_user)
		params[:users].each do |user|
			@conversation_member = ConversationMember.where(conversation_id: @conversation.id, user_id: user)
			@conversation_member ||=ConversationMember.create(conversation: @conversation, user: User.find_by(id: user))
		end
		@message = current_user.messages.build(message_params)
		@message.conversation_id = @conversation.id
		if @message.save!
			ActionCable.server.broadcast(
				"message",
				sent_by: current_user.first_name,
				body: @message
			)
			render json: @message.to_json({
				include: [
					# { images: { except: :message_id } },
					{ location: { except: :message_id } }
				]
			}), status: :ok
		else
			render json: @message.errors.full_messages, status: :bad_request
		end
	end

	private

	def message_params
		params.require(:message).permit(:body, images_attributes: [:url], location_attributes: [:latitude, :longitude])
	end

	def find_conversation!
		@conversation = Conversation.find_by(id: params[:conversation_id])
	end
end
