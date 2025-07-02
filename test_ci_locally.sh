#!/bin/bash

# Local CI Test Script
# This mimics the GitHub Actions workflow to test locally

set -e

echo "=== Testing Rails Application Locally ==="
echo

echo "1. Testing Bundle Install..."
if command -v bundle &> /dev/null; then
    bundle install
    echo "✅ Bundle install successful"
else
    echo "❌ Bundler not found. Install with: gem install bundler"
    exit 1
fi

echo
echo "2. Testing Rails Boot..."
if bundle exec rails runner "puts 'Rails boots successfully: ' + Rails.version"; then
    echo "✅ Rails boots successfully"
else
    echo "❌ Rails failed to boot"
    exit 1
fi

echo
echo "3. Testing Database Connection (requires PostgreSQL)..."
if command -v psql &> /dev/null; then
    echo "PostgreSQL found, testing database operations..."
    
    # Set test environment
    export RAILS_ENV=test
    export DATABASE_URL=postgres://localhost/test_local_ci
    
    # Create and setup database
    bundle exec rails db:create
    bundle exec rails db:schema:load
    
    # Test connection
    bundle exec rails runner "puts 'Database connection successful: ' + ActiveRecord::Base.connection.adapter_name"
    
    echo "✅ Database operations successful"
else
    echo "⚠️ PostgreSQL not found, skipping database tests"
    echo "To test database: install PostgreSQL and ensure it's running"
fi

echo
echo "4. Testing RSpec (if available)..."
if bundle exec rspec --version &> /dev/null; then
    echo "RSpec found, running tests..."
    bundle exec rspec
    echo "✅ RSpec tests passed"
else
    echo "⚠️ RSpec not available or tests failed"
fi

echo
echo "🎉 Local CI test completed successfully!"
echo "The application should work in GitHub Actions CI."