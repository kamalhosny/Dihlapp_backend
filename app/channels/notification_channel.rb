class NotificationChannel < ApplicationCable::Channel
  def subscribed
  	stream_from "message"
  end
end