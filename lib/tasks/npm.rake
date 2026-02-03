namespace :npm do
  desc "Install npm dependencies"
  task :install do
    next if Dir.exist?(Rails.root.join("node_modules"))

    system("npm install", exception: true)
  end
end

Rake::Task["assets:precompile"].enhance(["npm:install"])
