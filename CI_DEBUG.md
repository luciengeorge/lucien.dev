# CI Debug Plan: Rails 7.2 → 8.0 Upgrade

## Current Status: Conservative Rails 7.2 Setup

I've temporarily reverted to Rails 7.2 to isolate the CI issues and get a working baseline.

## Changes Made to Fix CI

### 1. **Removed Rails 8 Bleeding Edge Features**
```ruby
# Temporarily removed from Gemfile:
# gem 'rails', '~> 8.0.0'          # → 7.2.0
# gem 'solid_queue'                # Not stable yet
# gem 'solid_cache'                # Not stable yet
```

### 2. **Cleaned Up Webpacker Remnants**
```bash
# Removed files:
rm -rf config/webpack/
rm bin/webpack
rm bin/webpack-dev-server
rm bin/sidekiq
rm bin/sidekiqmon
```

### 3. **Conservative Job Configuration**
```ruby
# config/application.rb
config.active_job.queue_adapter = :async  # Instead of :solid_queue
```

### 4. **Simplified CI Workflow**
```yaml
# .github/workflows/ruby.yml
- Removed Redis service (not needed for :async jobs)
- Updated to latest GitHub Actions (v4)
- Simplified database setup with DATABASE_URL
- Removed TailwindCSS build step (for now)
```

## Expected CI Steps (Should Work Now)

1. ✅ **Checkout code**
2. ✅ **Install system dependencies** (libpq, etc.)
3. ✅ **Set up Ruby 3.3.0**
4. ✅ **Bundle install** (Rails 7.2 + modern gems)
5. ✅ **Set up Node.js 20**
6. ✅ **Install yarn dependencies**
7. ✅ **Create test database**
8. ✅ **Load database schema**
9. ✅ **Run RSpec tests**

## If CI Still Fails

### **Check These Common Issues:**

#### A. **Gem Version Conflicts**
```bash
# Look for version constraint errors in bundle install
bundle install --verbose
```

#### B. **Database Issues**
```bash
# Check database connection
bundle exec rails db:version
```

#### C. **Missing JavaScript Dependencies**
```bash
# Check yarn install
yarn install --frozen-lockfile
```

#### D. **Test Configuration Issues**
```bash
# Test environment setup
RAILS_ENV=test bundle exec rails db:create db:schema:load
```

## Incremental Upgrade Path

Once CI passes with Rails 7.2:

### **Step 1: Rails 8.0 Core**
```ruby
gem 'rails', '~> 8.0.0'
config.load_defaults 8.0
```

### **Step 2: Add Solid Queue**
```ruby
gem 'solid_queue'
config.active_job.queue_adapter = :solid_queue
```

### **Step 3: Add Solid Cache**
```ruby
gem 'solid_cache'
config.cache_store = :solid_cache_store
```

### **Step 4: TailwindCSS 4.0**
```bash
# Add TailwindCSS CLI build step
./bin/build-tailwind
```

### **Step 5: Re-add Removed Gems**
```ruby
gem 'rails_admin', '~> 4.0'  # When Rails 8 compatible
gem 'grover', '~> 1.0'       # When Rails 8 compatible
```

## Debugging Commands

If you need to debug locally:

```bash
# Test bundle install
bundle install

# Test database setup
RAILS_ENV=test bundle exec rails db:create db:schema:load

# Test basic Rails boot
bundle exec rails runner "puts Rails.version"

# Test RSpec
bundle exec rspec --version

# Test basic controller
bundle exec rails runner "ApplicationController.new"
```

## Rollback Commands

If we need to go back further:

```ruby
# Back to Rails 6.1 (original)
gem 'rails', '~> 6.1.3'
config.load_defaults 6.1

# Or Rails 7.0
gem 'rails', '~> 7.0.0'
config.load_defaults 7.0
```

## Expected Outcome

With Rails 7.2 and conservative settings, CI should:
- ✅ Bundle install successfully
- ✅ Create test database
- ✅ Load schema
- ✅ Run basic tests
- ✅ Pass without Rails 8 specific issues

Then we can incrementally add Rails 8 features once the baseline works.

---

**Current Priority**: Get Rails 7.2 CI passing first, then upgrade to 8.0 incrementally.