# Server Startup Fixes

## Issue
Rails server was failing to start with: `cannot load such file -- rack/canonical_host (LoadError)`

## Root Cause
The `config.ru` file was trying to load `rack/canonical_host` but we had removed the `rack-canonical-host` gem during the Rails upgrade.

## Fixes Applied

### 1. Fixed config.ru
- **Removed**: `require 'rack/canonical_host'`
- **Removed**: `use Rack::CanonicalHost, ENV['CANONICAL_HOST'], cache_control: 'max-age=3600' if ENV['CANONICAL_HOST']`
- **Cleaned up**: Duplicate require statements

### 2. Fixed Production Environment (config/environments/production.rb)
- **Replaced Postmark mailer** with SMTP configuration (can be configured with ENV vars)
- **Changed Active Storage** from `:amazon` to `:local` (since we removed aws-sdk-s3)
- **Replaced Redis cache** with `:memory_store` (since we removed redis gems)

### 3. Fixed Development Environment (config/environments/development.rb)
- **Commented out Bullet configuration** (since we removed bullet gem)
- **Replaced letter_opener mailer** with `:file` delivery method
- **Changed Active Storage** from `:amazon` to `:local`

### 4. Updated Storage Configuration (config/storage.yml)
- **Added local storage service** configuration for file uploads

## NEW Issue: SCSS Compilation Error
Server started but pages showed: `LoadError (cannot load such file -- sassc)`

### Root Cause
The app has SCSS files that need compilation, but we were missing the SCSS compiler gems.

### Additional Fixes Applied

### 5. Added SCSS Support (Gemfile)
- **Added**: `sassc-rails` gem for SCSS compilation

### 6. Temporarily Disabled Font-Awesome (app/assets/stylesheets/application.scss)
- **Commented out**: `@import 'font-awesome-sprockets';` and `@import 'font-awesome';`
- **Reason**: To get the app working first, can add font-awesome back later

## NEW Issue: CSS File Conflict
Server started but pages showed: `Multiple files with the same output path cannot be linked ("application.css")`

### Root Cause
Both `application.css` and `application.scss` existed and both compile to `application.css`, causing a Sprockets conflict.

### Additional Fixes Applied

### 7. Resolved CSS File Conflict
- **Deleted**: `app/assets/stylesheets/application.css` (the duplicate file)
- **Updated**: `app/assets/stylesheets/application.scss` with basic styles
- **Modified**: `app/assets/config/manifest.js` to specifically link `application.css` instead of all CSS files

## What Should Now Work
- ✅ Rails server should start without LoadError
- ✅ SCSS files should compile properly without conflicts
- ✅ Basic styling should work (buttons, forms, layout)
- ✅ File uploads will work using local disk storage
- ✅ Email delivery will work (files in dev, SMTP in prod)
- ✅ Caching will work using memory store
- ✅ Authentication and authorization (Devise + Pundit)
- ✅ Forms and pagination (SimpleForm + Pagy)
- ✅ GitHub API integration (Octokit)
- ✅ Component system (ViewComponent)

## What's Disabled/Changed
- ❌ No AWS S3 file storage (using local storage instead)
- ❌ No Postmark email service (using SMTP instead)
- ❌ No Redis caching (using memory cache instead)
- ❌ No Bullet N+1 query detection
- ❌ No letter_opener email preview in development
- ❌ No rack-canonical-host domain redirects
- ❌ No Font Awesome icons (temporarily disabled)
- ❌ Custom component styles from JavaScript directory (temporarily simplified)

## Commands to Run
After these changes, you need to run:
```bash
bundle install
```

Then restart your Rails server:
```bash
bin/rails server
```

## Adding Font Awesome Back Later
Once the app is working, you can add Font Awesome back by:

1. Add to Gemfile:
```ruby
gem 'font-awesome-sass'
```

2. Uncomment in `app/assets/stylesheets/application.scss`:
```scss
@import 'font-awesome-sprockets';
@import 'font-awesome';
```

3. Run `bundle install` and restart server.

## Re-enabling Custom Styles
The app originally had custom SCSS components in `app/javascript/stylesheets/`. Once basic functionality is working, you can gradually re-add these by importing them in `application.scss`.

## Next Steps
The server should now start successfully and pages should load without CSS compilation conflicts. The app will have basic styling and all core functionality should work. You can incrementally add back styling and visual enhancements later.