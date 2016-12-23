# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # need to get customers#show to get streaming
    stop_all_streams
    if current_user
    	stream_from "notification_#{current_user.id}_channel"
    else
    	stream_from "notification_new_user_channel"
    end
  end

  def unsubscribed
  	stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
