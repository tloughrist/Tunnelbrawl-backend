require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://red-chhu8aorddldrove8eq0:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://red-chhu8aorddldrove8eq0:6379' }
end