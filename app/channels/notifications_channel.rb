# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # need to get customers#show to get streaming

    stream_from "notification_#{current_user.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
