# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add rails_admin assets for propshaft
RailsAdmin::Engine.config.assets.paths.each do |path|
  Rails.application.config.assets.paths << path
end
