# Ensure Administrate assets are available to Propshaft.
Rails.application.config.assets.paths << Administrate::Engine.root.join("app/assets/builds")
Rails.application.config.assets.paths << Administrate::Engine.root.join("app/assets/stylesheets")
Rails.application.config.assets.paths << Administrate::Engine.root.join("app/assets/javascripts")
