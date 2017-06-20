class MessagesController < ApplicationController
	before_action :find_conversation!

	def new
		@message = current_user.messages.build
	end

	def create
		@conversation ||= Conversation.create(user_id: current_user.id)
		@message = current_user.messages.build(message_params)
		@message.conversation_id = @conversation.id

		if @message.save!
			render json: @message.to_json({
				include: [
					{ images: { except: :message_id } },
					{ location: { except: :message_id } }
				]
			}), status: :ok
		else
			render json: @message.errors.full_messages, status: :bad_request
		end
	end

	private

	def message_params
		params.require(:message).permit(:body,
																		images_attributes: [:url],
																		location_attributes: [:latitude, :longitude])
	end

	def find_conversation!
		@conversation = Conversation.find_by(id: params[:conversation_id])
	end
end
