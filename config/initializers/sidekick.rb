Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch["REDISCLOUD_URL"],
    password: ENV.fetch["REDIS_PASSWORD"],
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch["REDISCLOUD_URL"],
    password: ENV.fetch["REDIS_PASSWORD"],
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
end
