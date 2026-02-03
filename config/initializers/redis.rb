require "openssl"

$redis = Redis.new

url = ENV["REDISCLOUD_URL"] || ENV["REDIS_URL"]

if url
  ssl_options =
    if url.start_with?("rediss://")
      { ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
    else
      {}
    end

  Sidekiq.configure_server do |config|
    config.redis = { url: url }.merge(ssl_options)
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }.merge(ssl_options)
  end

  $redis = Redis.new({ url: url }.merge(ssl_options))
end
