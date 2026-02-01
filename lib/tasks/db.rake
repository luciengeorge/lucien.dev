namespace :db do
  desc 'Dumping production database...'
  task import: [:environment, :dump]

  task dump: [:environment] do
    status = system `git status --porcelain`
    if status.nil?
      puts "Checking out to main..."
      system "git checkout main"
      puts "Pulling last version of the code..."
      system "git pull origin main"
      puts "Dropping database..."
      system "rails db:drop"
      puts "Dumping db..."
      system "heroku pg:pull DATABASE_URL lucien_george_com_development --app lucien-george"
      system "bundle install"
      system "npm install"
      puts "Migrating..."
      system "rails db:migrate"
      puts "Done."
    else
      puts "Branch not clean."
    end
  end
end
