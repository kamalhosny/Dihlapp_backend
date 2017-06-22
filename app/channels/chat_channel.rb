
  #frozen_string_literal: true
  class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'message'
    end
  end
