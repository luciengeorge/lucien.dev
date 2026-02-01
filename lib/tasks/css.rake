namespace :css do
  desc "Build Tailwind CSS via npm"
  task :build do
    system("npm run build:css", exception: true)
  end
end

Rake::Task["assets:precompile"].enhance(["css:build"])
