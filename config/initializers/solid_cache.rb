# Rails 8 Solid Cache Configuration
# Solid Cache is a database-backed cache store for Rails 8

Rails.application.configure do
  # Use Solid Cache as the cache store
  config.cache_store = :solid_cache_store
end

# Configure Solid Cache behavior
if defined?(SolidCache)
  SolidCache.configure do |config|
    # Maximum size for cache entries (in bytes)
    config.max_size = 512.megabytes
    
    # How often to clean up expired entries (in seconds)
    config.max_age = 2.weeks
    
    # Database configuration (uses main database by default)
    # config.connects_to = { database: { writing: :cache, reading: :cache } }
  end
end