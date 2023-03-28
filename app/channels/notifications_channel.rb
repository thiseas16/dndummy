class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from connection.current_user.id
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
