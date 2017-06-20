# frozen_string_literal: true

class ConversationMembersController < ApplicationController
  before_action :set_conversation_members, only: %i[show destroy]

  # POST /conversation_members
  def create
    @conversation_members = ConversationMembers.new(conversation_members_params)

    respond_to do |format|
      if @conversation_members.save!
        format.json { render json: @conversation_members }
      else
        format.json { render json: @conversation_members.errors.full_messages, status: :bad_request }
      end
    end
  end

  # GET /conversation_members/:id
  def show
    respond_to do |format|
      format.json { render json: @conversation_members }
    end
  end

  # DELETE /conversation_members/:id
  def destroy
    @conversation_members.destroy

    respond_to do |format|
      format.json { render status: :ok }
    end
  end

  private

  def conversation_members_params
    params.require(:conversation_members).permit(:conversation_id, :user_id, :seen_at)
  end

  def set_conversation_members
    @conversation_members = ConversationMembers.find(params[:id])
  end
end