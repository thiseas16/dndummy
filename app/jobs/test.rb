class Test < ActiveJob::Base
  include Rails.application.routes.url_helpers
  def perform(user_id)
    sleep 2
    message = "hello!"
    redirect = campaigns_path
    ActionCable.server.broadcast(
      user_id, {message: message, redirect: redirect}
    )
  end
end
