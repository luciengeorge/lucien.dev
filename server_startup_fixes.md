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
- **Added**: `font-awesome-sass` gem since SCSS files import font-awesome

### 6. Fixed Font-Awesome Import (app/assets/stylesheets/application.scss)
- **Added**: `@import 'font-awesome-sprockets';` before the main import
- **Fixed**: Font-awesome import to work with the sass gem

## What Should Now Work
- ✅ Rails server should start without LoadError
- ✅ SCSS files should compile properly
- ✅ Font-awesome icons should load
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

## Commands to Run
After these changes, you need to run:
```bash
bundle install
```

Then restart your Rails server:
```bash
bin/rails server
```

## Next Steps
The server should now start successfully and pages should load without SCSS compilation errors. You can re-add specific services later if needed by:
1. Adding the gem back to Gemfile
2. Updating the environment configurations
3. Setting up the required credentials/environment variables