namespace :repos do
  desc "Update Repos data"
  task update: [ :environment ] do
    UpdateReposJob.perform_later
  end

  desc "Clean deleted repos"
  task clean: [ :environment ] do
    CleanReposJob.perform_later
  end
end
