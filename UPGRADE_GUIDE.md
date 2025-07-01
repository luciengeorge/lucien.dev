# Rails 8.0 and TailwindCSS 4.0 Upgrade Guide

This document outlines the upgrade from Rails 6.1.3.1 to Rails 8.0 and TailwindCSS 2.1.1 to 4.0.

## Summary of Changes

### Rails Upgrade (6.1.3.1 → 8.0.0)
- ✅ Updated Rails gem to `~> 8.0.0`
- ✅ Removed Webpacker and Turbolinks
- ✅ Added modern Rails 8 asset handling: importmap-rails, turbo-rails, stimulus-rails
- ✅ Integrated Rails 8 new features: Solid Queue, Solid Cache, Solid Cable
- ✅ Updated Stimulus to current stable version (3.2.2)
- ✅ Converted Turbolinks events to Turbo events
- ✅ Updated application layout files for Rails 8 asset system

### TailwindCSS Upgrade (2.1.1 → 4.0)
- ✅ Updated to TailwindCSS 4.0 with massive performance improvements
- ✅ Migrated to standalone CLI approach (no PostCSS dependency)
- ✅ Converted SCSS files to CSS with CSS custom properties
- ✅ Created modern CSS structure with @layer and @theme directives
- ✅ Updated color palette to OKLCH format for better vibrancy

### JavaScript/Asset Pipeline Changes
- ✅ Migrated from Webpacker to Importmap
- ✅ Updated package.json dependencies (removed build tools)
- ✅ Created new application.js entry point
- ✅ Moved components to new structure
- ✅ Updated Stimulus controllers for Rails 8

## Installation Steps

### 1. Install Dependencies

```bash
# Install Ruby dependencies
bundle install

# Install JavaScript dependencies (minimal now)
yarn install
# or
npm install
```

### 2. Generate Rails 8 Configuration

```bash
# Generate importmap configuration
rails importmap:install

# Generate Turbo configuration
rails turbo:install

# Generate Stimulus configuration
rails stimulus:install

# Install Solid Queue (database-backed jobs)
rails generate solid_queue:install

# Install Solid Cache (database-backed caching)
rails generate solid_cache:install
```

### 3. Set up TailwindCSS 4.0

```bash
# Build TailwindCSS using standalone CLI
./bin/build-tailwind

# For development with file watching:
./bin/build-tailwind --watch
```

### 4. Database Updates

```bash
# Run pending migrations
rails db:migrate

# Install Solid Queue migrations
rails solid_queue:install:migrations
rails db:migrate

# Install Solid Cache migrations  
rails solid_cache:install:migrations
rails db:migrate

# Check for Rails 8 compatibility issues
rails app:update
```

### 5. Update Configuration

The following files have been updated for Rails 8.0 compatibility:

- `config/application.rb` - Updated to load Rails 8.0 defaults
- `config/boot.rb` - Updated for modern bundler
- `config/importmap.rb` - New importmap configuration
- `config/tailwind.config.js` - TailwindCSS 4.0 configuration
- `config/initializers/solid_queue.rb` - Solid Queue configuration
- `config/initializers/solid_cache.rb` - Solid Cache configuration

### 6. Asset Pipeline Changes

**Removed Files:**
- `babel.config.js` (Webpacker)
- `config/webpacker.yml` (Webpacker)
- `postcss.config.js` (TailwindCSS 4.0 doesn't need PostCSS)

**New Files:**
- `app/javascript/application.js` (Main entry point)
- `app/javascript/controllers/application.js` (Stimulus config)
- `config/importmap.rb` (Import maps)
- `app/assets/stylesheets/application.css` (Main CSS with TailwindCSS 4.0)
- `bin/build-tailwind` (TailwindCSS build script)
- `config/tailwind.config.js` (TailwindCSS 4.0 configuration)

### 7. JavaScript Structure Changes

```
app/javascript/
├── application.js          # Main entry point (NEW)
├── controllers/
│   ├── application.js      # Stimulus application (NEW)
│   ├── index.js           # Updated for Rails 8
│   └── *_controller.js    # Existing controllers (unchanged)
└── components/
    ├── analytics.js       # Updated for Turbo events
    └── live_typing.js     # Moved from packs/
```

### 8. CSS Structure Changes

```
app/assets/stylesheets/
├── application.css        # Main CSS file with TailwindCSS 4.0 (NEW)
└── builds/
    └── tailwind.css       # Generated TailwindCSS output (NEW)
```

## Breaking Changes to Address

### 1. Turbolinks → Turbo Events
- `turbolinks:load` → `turbo:load`
- `turbolinks:visit` → `turbo:visit`
- Update any custom JavaScript event listeners

### 2. TailwindCSS v4.0 Changes
- Color palette updated to OKLCH format for better vibrancy
- Configuration now in JavaScript file instead of CSS-first approach
- Standalone CLI replaces PostCSS plugin
- Some utility class names may have changed

### 3. Webpacker → Importmap
- No more `javascript_pack_tag` or `stylesheet_pack_tag`
- Use `javascript_importmap_tags` instead
- CSS handled through asset pipeline

### 4. Sidekiq → Solid Queue
- Job processing now uses database instead of Redis
- Update Procfile and deployment scripts
- Monitor jobs through Rails admin interface

## Rails 8 New Features

### 1. Solid Queue
- **Database-backed job processing** instead of Redis
- Better reliability and persistence
- Built-in web UI for monitoring jobs
- Automatic scaling based on queue depth

### 2. Solid Cache
- **Database-backed caching** instead of Redis/Memcached
- Persistent across server restarts
- Better for applications with infrequent cache misses
- Simpler deployment (no additional services)

### 3. Solid Cable (optional)
- Database-backed Action Cable adapter
- Eliminates Redis dependency for WebSockets
- Better for low-traffic real-time features

## Testing the Upgrade

### 1. Start the Rails Server
```bash
rails server
```

### 2. Start Background Workers
```bash
# In a separate terminal
rails solid_queue:start
```

### 3. Build CSS (Development)
```bash
# In a separate terminal for file watching
./bin/build-tailwind --watch
```

### 4. Check for Issues
- Verify all pages load correctly
- Test JavaScript functionality
- Confirm Stimulus controllers work
- Validate CSS/TailwindCSS styling
- Test job processing with Solid Queue

### 5. Run Tests
```bash
# Run full test suite
rspec

# Run system tests specifically
rspec spec/system/
```

## Performance Benefits

### Rails 8.0 Improvements
- **No Redis Required**: Database-backed queue and cache reduce infrastructure complexity
- **Better Reliability**: Jobs and cache persist across server restarts
- **Simpler Deployment**: Fewer moving parts and dependencies
- **Modern Standards**: Latest web platform features built-in

### TailwindCSS v4.0 Improvements
- **Massive Speed Boost**: Up to 10x faster builds
- **Standalone CLI**: No Node.js build pipeline required
- **Modern CSS**: Native cascade layers, container queries, advanced color spaces
- **Smaller Bundles**: Better tree-shaking and optimization

## Deployment Considerations

### 1. Infrastructure Changes
- **Remove Redis** if only used for jobs/cache (optional)
- **Update Procfile** for Solid Queue workers
- **Database scaling** may be needed for high job volume

### 2. Environment Variables
- Remove Redis connection strings if not needed elsewhere
- Add database connection pooling for job workers
- Update cache configuration

### 3. Monitoring
- Set up database monitoring for job queue tables
- Monitor Solid Cache performance
- Update logging for new job processing

## Rollback Plan

If issues arise, you can rollback by:

1. Checkout the previous commit: `git checkout HEAD~1`
2. Or revert specific files:
   - `git checkout HEAD~1 -- Gemfile Gemfile.lock`
   - `git checkout HEAD~1 -- package.json`
   - `git checkout HEAD~1 -- config/application.rb`

## Resources

- [Rails 8.0 Release Notes](https://guides.rubyonrails.org/8_0_release_notes.html)
- [TailwindCSS v4.0 Documentation](https://tailwindcss.com/docs)
- [Solid Queue Documentation](https://github.com/rails/solid_queue)
- [Solid Cache Documentation](https://github.com/rails/solid_cache)
- [Turbo Documentation](https://turbo.hotwired.dev/)
- [Stimulus Documentation](https://stimulus.hotwired.dev/)

## Next Steps

1. Test thoroughly in development
2. Deploy to staging environment
3. Run full test suite
4. Monitor database performance with new queue/cache tables
5. Update team documentation for Rails 8 workflows
6. Consider removing Redis if no longer needed