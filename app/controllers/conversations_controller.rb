class ConversationsController < ApplicationController

  # before_action :set_conversation, except: [:index]
  # before_action :check_participating!, except: [:index]

  def index
    @conversations = Conversation.all
    # @conversations = Conversation.participating(current_user).order('updated_at DESC')
    render json: @conversations
  end

  def show
    @messages = Conversation.find_by(id: params[:id]).messages
    render json: @messages
  end

  def destroy
    @conversation.destroy
  end

  # def create
  #   # redirect_to conversation_path(@conversation) and return if @conversation
  #   # @message = current_user.messages.build
  #   @conversation = Conversation.new
  #   if @conversation.save
  #     @conversation_member = ConversationMember.create([conversation_id:  @conversation.id, user_id: current_user.id])
  #     format.json { render json: @conversation}
  #   else
  #     format.json { render json: @conversation.errors.full_messages}
  #   end
  #   set_conversation_members(conversation_members_params)
  # end
  #
  # def find_conversation!
  #   if params[:receiver_id]
  #     @receiver = User.find_by(id: params[:receiver_id])
  #     redirect_to(root_path) and return unless @receiver
  #     @conversation = Conversation.between(current_us      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
  #   elseer.id, @receiver.id)[0]
  #   else
  #     @conversation = Conversation.find_by(id: params[:conversation_id])
  #     redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
  #   end
  # end

  private

  # def set_conversation
  #   @conversation = Conversation.find_by(id: params[:id])
  # end

  # def check_participating!
  #   redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  # end

end
