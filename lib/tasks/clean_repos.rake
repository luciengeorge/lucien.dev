namespace :clean_repos do
  desc "Clean deleted repos"
  task run: [ :environment ] do
    CleanReposJob.perform_later
  end
end
