require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module LucienGeorgeCom
  class Application < Rails::Application
    config.load_defaults 8.1
    config.active_job.queue_adapter = :sidekiq
    config.autoload_paths << Rails.root.join("app/fields")
    config.eager_load_paths << Rails.root.join("app/fields")
  end
end
