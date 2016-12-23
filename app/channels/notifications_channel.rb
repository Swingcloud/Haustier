# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    	stream_from "notification_#{current_user.id}_channel"
  end

  def unsubscribed
  	stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end



end
