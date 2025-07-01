# Rails 7.2 and TailwindCSS 4.1 Upgrade Guide

This document outlines the upgrade from Rails 6.1.3.1 to Rails 7.2 and TailwindCSS 2.1.1 to 4.1.11.

## Summary of Changes

### Rails Upgrade (6.1.3.1 → 7.2)
- ✅ Updated Rails gem to `~> 7.2.0`
- ✅ Removed Webpacker and Turbolinks
- ✅ Added modern Rails 7 asset handling: importmap-rails, turbo-rails, stimulus-rails
- ✅ Updated Stimulus to current stable version (3.2.2)
- ✅ Converted Turbolinks events to Turbo events
- ✅ Updated application layout files for Rails 7 asset system

### TailwindCSS Upgrade (2.1.1 → 4.1.11)
- ✅ Updated TailwindCSS to `~> 4.1.11`
- ✅ Updated tailwindcss-rails gem to `~> 3.0`
- ✅ Converted SCSS files to CSS with CSS custom properties
- ✅ Updated PostCSS configuration for TailwindCSS v4.1
- ✅ Created new CSS structure compatible with TailwindCSS v4

### JavaScript/Asset Pipeline Changes
- ✅ Migrated from Webpacker to Importmap
- ✅ Updated package.json dependencies
- ✅ Created new application.js entry point
- ✅ Moved components to new structure
- ✅ Updated Stimulus controllers for Rails 7

## Installation Steps

### 1. Install Dependencies

```bash
# Install Ruby dependencies
bundle install

# Install JavaScript dependencies (if using npm packages)
yarn install
# or
npm install
```

### 2. Generate Rails 7 Configuration

```bash
# Generate importmap configuration
rails importmap:install

# Generate Turbo configuration
rails turbo:install

# Generate Stimulus configuration
rails stimulus:install

# Install TailwindCSS for Rails
rails tailwindcss:install
```

### 3. Database Updates

```bash
# Run any pending migrations
rails db:migrate

# Check for Rails 7 compatibility issues
rails app:update
```

### 4. Update Configuration

The following files have been updated for Rails 7.2 compatibility:

- `config/application.rb` - Updated to load Rails 7.2 defaults
- `config/boot.rb` - Updated for modern bundler
- `config/importmap.rb` - New importmap configuration
- `postcss.config.js` - Updated for TailwindCSS v4.1

### 5. Asset Pipeline Changes

**Removed Files:**
- `babel.config.js` (Webpacker)
- `config/webpacker.yml` (Webpacker)

**New Files:**
- `app/javascript/application.js` (Main entry point)
- `app/javascript/controllers/application.js` (Stimulus config)
- `config/importmap.rb` (Import maps)
- `app/assets/stylesheets/application.css` (Main CSS with TailwindCSS v4.1)

### 6. JavaScript Structure Changes

```
app/javascript/
├── application.js          # Main entry point (NEW)
├── controllers/
│   ├── application.js      # Stimulus application (NEW)
│   ├── index.js           # Updated for Rails 7
│   └── *_controller.js    # Existing controllers (unchanged)
└── components/
    ├── analytics.js       # Updated for Turbo events
    └── live_typing.js     # Moved from packs/
```

### 7. CSS Structure Changes

```
app/assets/stylesheets/
├── application.css        # Main CSS file with TailwindCSS v4.1 (NEW)
├── config/
│   ├── fonts.css         # Converted from SCSS
│   ├── colors.css        # CSS custom properties
│   └── shared.css        # Basic styles
├── components/
│   └── index.css         # Component styles
└── pages/
    └── index.css         # Page-specific styles
```

## Breaking Changes to Address

### 1. Turbolinks → Turbo Events
- `turbolinks:load` → `turbo:load`
- `turbolinks:visit` → `turbo:visit`
- Update any custom JavaScript event listeners

### 2. TailwindCSS v4.1 Changes
- Color palette updated to OKLCH format
- Some utility class names changed (see TailwindCSS v4 upgrade guide)
- Configuration now in CSS instead of JavaScript

### 3. Webpacker → Importmap
- No more `javascript_pack_tag` or `stylesheet_pack_tag`
- Use `javascript_importmap_tags` instead
- CSS handled through asset pipeline

## Testing the Upgrade

### 1. Start the Rails Server
```bash
rails server
```

### 2. Check for Issues
- Verify all pages load correctly
- Test JavaScript functionality
- Confirm Stimulus controllers work
- Validate CSS/TailwindCSS styling

### 3. Run Tests
```bash
# Run full test suite
rspec

# Run system tests specifically
rspec spec/system/
```

## Potential Issues and Solutions

### 1. Missing JavaScript Dependencies
If you see import errors, you may need to pin additional packages in `config/importmap.rb`:

```ruby
pin "package-name", to: "https://cdn.skypack.dev/package-name"
```

### 2. CSS Styling Issues
- Check that custom CSS classes are properly converted from SCSS
- Verify TailwindCSS v4.1 class compatibility
- Update any hardcoded colors to use new OKLCH format

### 3. Stimulus Controller Issues
- Ensure all controllers import from the new paths
- Check that `application` instance is properly exported
- Verify controller registration in `index.js`

### 4. Turbo Navigation Issues
- Update event listeners from Turbolinks to Turbo
- Check form submissions work with Turbo
- Verify analytics and tracking code

## Performance Benefits

### Rails 7.2
- Improved asset loading with importmap
- Better caching with Turbo Drive
- Reduced JavaScript bundle size

### TailwindCSS v4.1
- Significant build performance improvements (3-5x faster)
- Modern CSS features (cascade layers, color-mix())
- Reduced CSS output size

## Rollback Plan

If issues arise, you can rollback by:

1. Checkout the previous commit: `git checkout HEAD~1`
2. Or revert specific files:
   - `git checkout HEAD~1 -- Gemfile Gemfile.lock`
   - `git checkout HEAD~1 -- package.json`
   - `git checkout HEAD~1 -- app/views/layouts/`

## Resources

- [Rails 7.2 Release Notes](https://guides.rubyonrails.org/7_2_release_notes.html)
- [TailwindCSS v4.0 Upgrade Guide](https://tailwindcss.com/docs/upgrade-guide)
- [Importmap for Rails](https://github.com/rails/importmap-rails)
- [Turbo Documentation](https://turbo.hotwired.dev/)
- [Stimulus Documentation](https://stimulus.hotwired.dev/)

## Next Steps

1. Test thoroughly in development
2. Deploy to staging environment
3. Run full test suite
4. Monitor for any performance regressions
5. Update documentation for team members